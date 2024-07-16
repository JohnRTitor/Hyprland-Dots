#!/usr/bin/env bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# For NixOS starting of polkit-pantheon. Dec 2023, the settings stated in NixOS wiki does not work so have to manual start it
# Modified by: JohnRTitor to work with polkit-pantheon

# Find all polkit-gnome executables in the Nix store
polkit_pantheon_paths=$(find /nix/store -name 'io.elementary.desktop.agent-polkit' -type f 2>/dev/null)

for polkit_pantheon_path in $polkit_pantheon_paths; do
  # Extract the directory containing the executable
  polkit_pantheon_dir=$(dirname "$polkit_pantheon_path")

  # Check if the executable is valid and exists
  if [ -x "$polkit_pantheon_dir/io.elementary.desktop.agent-polkit" ]; then
    # Start the Polkit-Pantheon Authentication Agent
    "$polkit_pantheon_dir/io.elementary.desktop.agent-polkit" &
    exit 0
  fi
done

# If no valid executable is found, report an error
echo "No valid Polkit-Pantheon Authentication Agent executable found."
