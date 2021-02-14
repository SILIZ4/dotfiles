# Load background
. ~/.fehbg

# Apply Xresources config to terminal emulator
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Set keyboard layout
setxkbmap -layout ca

exec i3
