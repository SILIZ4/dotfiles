. ~/.fehbg
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
setxkbmap -layout ca

#nm-applet &
#exec i3

. ~/.dwmstatus &
exec dwm
