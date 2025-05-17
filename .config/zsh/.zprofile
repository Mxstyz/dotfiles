#Default programs
export EDITOR="nvim"
export TERMINAL="foot"

#PATH
export PATH="$PATH:$(find $HOME/.local/bin -type d | paste -sd ':' -)"

#Dark mode theming
export GTK_THEME=Adwaita:dark
export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
export QT_STYLE_OVERRIDE=Adwaita-Dark

#Autostart Hyprland
if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec Hyprland
fi

