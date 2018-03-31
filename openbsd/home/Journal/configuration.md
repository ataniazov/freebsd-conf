# Configuration

## Switch to root

```
su
```

## Do as root

```
usermod -G wheel <user_name>
echo "permit keepenv :wheel >> /etc/doas.conf
```

## Packages

### Search

```
pkg_info -Q <package_name>
```

### Install

```
pkg_add -v <package_name>
```

### Change shell

```
doas pkg_add -v bash
chsh -s /usr/local/bin/bash
```
