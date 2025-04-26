To install a new system:
1. Update system
sudo dnf upgrade --refresh

2. Go to rpmfusion.org/Configuration:
    a. enable access to free and nonfree
    b. install Appstream metadata ('sudo dnf update @core') - I think only for GNOME software so not needed.
    c. install additional codecs

3. Run clone.sh: this clones the .dotfiles repo. 

4. Run install.sh: this installs all the packages.

5. From auto, run 'python -m fedora.symlinks': this creates symlinks of the dotfiles.

6. Create symlink to 'update.sh' script in your path
sudo ln -s ~/.dotfiles/auto/fedora/update.sh /usr/local/bin/update
chmod +x /usr/local/bin/update

7. To show background on login screen:
    a. copy background to /usr/share/backgrounds
    b. edit /etc/lightdm/lightdm-gtk-greeter.conf in greeter section to use background file as background

8. Enable a Nord theme
    a. firefox: Nord Polar Night Theme by christos
    b. thunderbird: nord-hardt (download and install)

9. Setup and sync OneDrive

10. Setup Proton Bridge, Thunderbird and neomutt.

11. Add 1password extension to Firefox.

12. Set up Obsidian.
    a. Create vault in Documents.
    b. Create a VAULT/.obsidian/themes directory
    c. Inside that directory run 'git clone git@github.com:EndlessReform/obsidian-nord-muted'
    d. Select theme under Appearance/Themes.

13. In future, to update system (between Fedora versions) run 'update'.

14. To clean up extra kernels, run 'remove_kernels.sh'.
