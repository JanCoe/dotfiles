1. Update system
sudo dnf upgrade --refresh

2. Go to rpmfusion.org/Configuration:
    a. enable access to free and nonfree
    b. install Appstream metadata ('sudo dnf update @core')
    c. install additional codecs

3. Run clone.sh

4. Run install.sh

5. Run symlinks.py

6. Create symlink to 'update.sh' scrip in your path
sudo ln -s ~/.dotfiles/scripts/fedora/update.sh /usr/local/bin/update
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


