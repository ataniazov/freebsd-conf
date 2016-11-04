#!/usr/local/bin/bash

## not: server /etc/ssh/sshd_config dosyasina "PermitTunnel yes" satirini ekle

if [ "$1" == "--help" ] || [ "$1" == "" ]; then
	echo "usage : bsd2linux-ssh-vpn.sh RSA_FILE SERVER [TUN_NO] [PORT]"
	echo "        bsd2linux-ssh-vpn.sh --pwd SERVER [TUN_NO] [PORT]"
	exit
fi

if [ "$SERVER_SCRIPT" == "" ]; then
	SERVER_SCRIPT=local
fi

ID_RSA=$1
SERVER_IP_OR_DOMAIN=$2
TUN_NO=$3
SERVER_PORT=$4

DNS=8.8.8.8

validate_ip() {
	if [[ $1 =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
		return 0
	else
		return 1
	fi
}

clean_exit() {
	answer=""
	while [ "$answer" != "exit" ]; do
		sleep 0.1
		echo -n "write 'exit' for clean exit: "
		read answer
	done

	route del $SERVER_IP
	route change default $OLD_GATEWAY
	echo "[CLIENT] gateway: $(get_gateway)"
	echo "[CLIENT] clean ok"
}

run() {
	[ "$ID_RSA" != "" ] || exit 1

	if [ "$TUN_NO" == "" ]; then
		TUN_NO=1
	fi

	if [ "$SERVER_PORT" == "" ]; then
		SERVER_PORT=22
	fi

	if validate_ip ${SERVER_IP_OR_DOMAIN}; then
		SERVER_IP=$SERVER_IP_OR_DOMAIN
	else
		SERVER_IP=$(convert_domain_to_ip $SERVER_IP_OR_DOMAIN)
		if ! validate_ip ${SERVER_IP} ; then
			echo "server parameter : ${SERVER_IP_OR_DOMAIN}"
			echo "SERVER_IP error : ${SERVER_IP}"
			echo "check default gateway"
			echo "check DNS configuration if server parameter is domain name"
			exit 1
		fi
	fi

	# tunnel device IP configuration
	IP_3=$((200 + $TUN_NO))
	CLIENT_TUN=$TUN_NO
	CLIENT_TUN_IP=192.168.${IP_3}.2
	SERVER_TUN=$TUN_NO
	SERVER_TUN_IP=192.168.${IP_3}.1
	NETMASK=255.255.255.0

	OLD_GATEWAY=$(get_gateway)
	OLD_INTERFACE=$(get_interface)
	echo "[CLIENT] ssh-server: $SERVER_IP:$SERVER_PORT"
	echo "[CLIENT] gateway: $OLD_GATEWAY - interface: $OLD_INTERFACE "


	trap "clean_exit" SIGTERM EXIT SIGKILL

	route add -host $SERVER_IP $OLD_GATEWAY;
	ROUTE_CONFIG='\
		ifconfig tun'$CLIENT_TUN' '$CLIENT_TUN_IP' '$SERVER_TUN_IP' netmask '$NETMASK'; \
		route change default $SERVER_TUN_IP;'

	DNS_CONFIG='echo nameserver '$DNS' > /etc/resolv.conf ;'
	
	echo "[CLIENT] SERVER_SCRIPT : $SERVER_SCRIPT"
	if [ "$SERVER_SCRIPT" == "local" ]; then
		REMOTE_COMMAND='ifconfig tun'$SERVER_TUN' '$SERVER_TUN_IP' pointopoint '$CLIENT_TUN_IP' netmask '$NETMASK'; \
			echo "[SERVER] tun'$SERVER_TUN': '$SERVER_TUN_IP'"; \
			\
			INTERNET_INTERFACE=$(ip route get 8.8.8.8 | head -n 1 | awk '"'"'{print $5}'"'"' | tr -d '"'"'\n'"'"') ; \
			echo "[SERVER] internet interface: $INTERNET_INTERFACE" ; \
			\
			echo 1 > /proc/sys/net/ipv4/ip_forward; \
			iptables -t nat -A POSTROUTING -o $INTERNET_INTERFACE -j MASQUERADE; \
			echo "[SERVER] internet sharing ready"; \
		'
	elif [ "$SERVER_SCRIPT" == "remote" ]; then
		REMOTE_COMMAND='sshvpn_server.sh '$SERVER_TUN' '$SERVER_TUN_IP' '$CLIENT_TUN_IP' '$NETMASK' '
	else
		REMOTE_COMMAND=$SERVER_SCRIPT
	fi

	if [ $ID_RSA == "--pwd" ]; then
		SSH_COMMAND="ssh"
	else
		SSH_COMMAND="ssh -i $ID_RSA"
	fi

	$SSH_COMMAND \
		-o PermitLocalCommand=yes \
		-o LocalCommand="$LOCAL_COMMAND" \
		-o ServerAliveInterval=60 \
		-w $CLIENT_TUN:$SERVER_TUN \
		\
		root@$SERVER_IP -p $SERVER_PORT \
		"$REMOTE_COMMAND"

	SSH_EXIT_CODE=$?
	
	echo -e "\n"
	echo "WARNING: ssh process exited with $SSH_EXIT_CODE"
	echo "[CLIENT] gateway: $(get_gateway)"
	echo

	wait
}

run