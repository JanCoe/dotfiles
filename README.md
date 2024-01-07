## Steps to bootstrap a new Mac
1. Install Apple's Command Line Tools, which are prerequisites for Git and Homebrew.

~~~
xcode-select --install
~~~

2. Clone repo into new hidden directory.
~~~
# Use SSH (if set up) ...
git clone git@github.com:JanCoe/dotfiles.git ~/.dotfiles

# ...or use HTTPS and switch remotes later.
git clone https:/github.com/JanCoe/dotfiles.git ~/.dotfiles
~~~
In practice, difficulty with getting permission inside the terminal means it is easier in Pycharm.

3. Create symlinks in the Home directory to the real files in the real files in the repo.

~~~
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.gitconfig ~/.zshrc
etc.
~~~

4. Install Homebrew, followed by the software listed in the Brewfile.
~~~
# Install Homebrew
/bin/bash -c "$(curl fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Then pass in the Brewfile location...
brew bundle --file ~/.dotfiles/Brewfile

# ...or move to the directory first.
cd ~/.dotfiles && brew bundle
~~~

### TODO List

- Learn how to use defaults to record and restore System Preferences and other macOS configurations.
- Automate symlinking and run script files with a bootstrapping tool like Dotbot.
- Revisit the list in .zshrc to customize the shell.
- Make a checklist of steps to decommission your computer before wiping your hard drive.
- Create a bootable USB installer for macOS.
- Integrate other cloud services into your Dotfiles process (Dropbox, OneDrive, etc.).
- Find inspiration and examples in other Dotfiles repositories at dotfiles.github.io.
