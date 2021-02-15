# Gentoo Portage config

The best way to backup the files is a hardlink if the files are on the same filesystem. Otherwise, it is possible to mount the directories in `/etc/fstab` with the `bind` argument.
The directory `portage-etc` is binded to `/etc/portage` and `portage-var` to `/var/lib/portage`.
