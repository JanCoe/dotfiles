## Steps to setup a new machine
### Install Apple's Command Line Tools
These tools are prerequisites for Git and Homebrew.
~~~shell
xcode-select --install
~~~

### Install Homewbrew

Install homebrew and the files listed in the Brewfile.
~~~shell
# Install Homebrew
/bin/bash -c "$(curl fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Then pass in the Brewfile location...
brew bundle --file ~/.dotfiles/scripts/macos/Brewfile

# ...or move to the directory first.
cd ~/.dotfiles/scripts/macos && brew bundle
~~~

Command to update the content of the Brewfile is:
~~~
brew bundle dump
~~~
This creates a Brewfile in the current directory.

### rustup 
Install rust by running command at rustup.rs.

### Authenticate github

Authenticate with
~~~shell
gh auth login
~~~

Follow instructions to save token.

Alternative is doing it inside an IDE.

### Clone dotfiles repo
~~~shell
# Use SSH (if set up) ...
git clone git@github.com:JanCoe/dotfiles.git ~/.dotfiles

# ...or use HTTPS and switch remotes later.
git clone https:/github.com/JanCoe/dotfiles.git ~/.dotfiles
~~~

### Create symlinks
See fedora folder for a python script to automate this.

Create a symlink for each dotfile in the repo.
~~~shell
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
etc.
~~~

#### Other

Install packages from package manager or directly if not up to date.

The following are Rust packages which could be installed using cargo if not in the package manager:
nu (nushell)
ruff
starship
uutils
uv (from git not crates.io because of reliance on unpublished crates)
wezterm
zoxide

### TODO List

- Learn how to use defaults to record and restore System Preferences and other MacOS configurations.
- Make a checklist of steps to decommission your computer before wiping your hard drive.
- Create a bootable USB installer for macOS.
- Integrate other cloud services into your Dotfiles process (Dropbox, OneDrive, etc.).
