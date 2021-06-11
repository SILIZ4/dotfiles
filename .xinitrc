# Load background
. ~/.fehbg

# Apply Xresources config to terminal emulator
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Set keyboard layout
setxkbmap -layout ca

#nm-applet &
#exec i3

xset +fp /home/simon/.fonts &
while xsetroot -name "test"
do
   sleep 10
done &
exec dwm
