This is currently just notes on my research on how to install the Fedora Atomic Sway edition.

1. Enable codecs. Best done in rpmfusion. Instruction in rpmfusion.org on how to do for Silverblue.

2. Enable COPR repository. For wezterm because I assume it needs low level access to the system.

3. rpmos-tree for wezterm.

4. nushell the same?

5. Install development tools if not installed by default using rpmos-tree.

6. Enable flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

7. Amend fedora-i3 script to install flatpaks.


