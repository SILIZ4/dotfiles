if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

. ~/.local/scripts/fehbg
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
setxkbmap -layout ca

#nm-applet &
#exec i3

flameshot &  # Start daemon to enable clipboard
. ~/.local/scripts/dwmstatus &
exec dwm
