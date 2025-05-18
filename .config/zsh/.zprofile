# Default programs
export EDITOR="nvim"
export TERMINAL="foot"

local_bin="$HOME/.local/bin"

# Add main Binaries folders explicitly
export PATH="$PATH:$local_bin/Binaries"
export PATH="$PATH:$local_bin/Binaries/nvim-linux-x86_64/bin"

# Function to add all subdirectories recursively to PATH
add_all_subdirs() {
  base_dir="$1"
  if [ -d "$base_dir" ]; then
    while IFS= read -r -d '' dir; do
      export PATH="$PATH:$dir"
    done < <(find "$base_dir" -type d -print0)
  fi
}

# Add all subdirectories inside PrivateScripts and PublicScripts
add_all_subdirs "$local_bin/PrivateScripts"
add_all_subdirs "$local_bin/PublicScripts"

# Dark mode theming
export GTK_THEME=Adwaita:dark
export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
export QT_STYLE_OVERRIDE=Adwaita-Dark

# Autostart Hyprland if conditions met
if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec Hyprland
fi

