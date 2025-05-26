To install a new system:
1. Edit /etc/dnf/dnf.conf to include the following:
[main]
fastestmirror=True
keepcache=True
defaultyes=True
skip_unavailable=True
max_parallel_downloads=10
install_weak_deps=False

2. Update system
sudo dnf upgrade --refresh

3. Go to rpmfusion.org/Configuration:
    a. enable access to free and nonfree
    b. install additional codecs

4. Run clone.sh: this clones the .dotfiles repo. 

5. Run install.sh: this installs all the packages.

6. From auto, run 'python -m fedora-i3.symlink-configs': this creates symlinks of the dotfiles.

7. Run install-kew.sh to install kew music player.

7. Install i3lock-fancy:
cd ~/Downloads
git clone https://github.com/meskarune/i3lock-fancy.git
cd i3lock-fancy
sudo make install
cd ..
rm -rf i3lock-fancy

8. Create symlink to 'update.sh' script in your path
sudo ln -s ~/.dotfiles/auto/fedora-i3/update.sh /usr/local/bin/update
chmod +x /usr/local/bin/update

9. Create symlink to 'switch-display.sh' script in your path
ln -s ~/.dotfiles/auto/fedora-i3/switch-display.sh ~/.local/bin/switch-display.sh

chmod +x ~/.dotfiles/auto/fedora-i3/switch-display.sh

9a. Set it up so that dunst runs under i3 and mako under wayland:
systemctl --user daemon-reexec
systemctl --user daemon-reload
systemctl --user enable --now mako.service
systemctl --user enable --now dunst.service

9b. Add the following line to /etc/pam.d/lightdm (to ensure LighDM is launching the session via PAM with systemd support).
session optional pam_systemd.so

10. To show background on login screen:
    a. copy background to /usr/share/backgrounds
    b. edit /etc/lightdm/lightdm-gtk-greeter.conf in greeter section to use background file as background

11. Enable a Nord theme
    a. firefox: Nord Polar Night Theme by christos
    b. thunderbird: Nord Hardt by artrz (download and install)
    c. rofi: Nord theme from github 

12. Setup and sync OneDrive by running 'onedrive --sync'.

13. Setup Proton Bridge, Thunderbird and neomutt.

14. Add 1password extension to Firefox. Install 1password following instructions on their website.

15. Sync with Obsidian vault. The following steps appear to be automatic:
    a. Create vault in Documents.
    b. Create a VAULT/.obsidian/themes directory
    c. Inside that directory run 'git clone git@github.com:EndlessReform/obsidian-nord-muted'
    d. Select theme under Appearance/Themes.

16. Install Jetbrains Toolbox App from their website. Use that to install Pycharm and RustRover.

17. Install HyperBackupExplorer from Synology website for exploring backups.

18. In future, to update system (between Fedora versions) run 'update-fedora'.

19. To clean up extra kernels, run 'remove-kernels'.
