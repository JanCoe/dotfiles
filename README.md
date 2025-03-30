## Steps to setup a new machine
### Install Apple's Command Line Tools (MacOS only)
These tools are prerequisites for Git and Homebrew.
~~~shell
xcode-select --install
~~~

### rustup 
Install rustup with command at rustup.rs.
Run `rustup` in terminal.

### Install github CLI

This is a helper utility that deals with github authentication. It enables cloning from the terminal.
~~~shell
sudo apt install gh
~~~

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

Create a symlink for each dotfile in the repo.
~~~shell
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
etc.
~~~

### Install other software
#### Homebrew packages (Mac only)

Install homebrew and the files listed in the Brewfile.
~~~shell
# Install Homebrew
/bin/bash -c "$(curl fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Then pass in the Brewfile location...
brew bundle --file ~/.dotfiles/Brewfile

# ...or move to the directory first.
cd ~/.dotfiles && brew bundle
~~~

Command to update the content of the Brewfile is:
~~~
brew bundle dump
~~~
This creates a Brewfile in the current directory.

#### Other

Install packages from package manager or directly if not up to date.

The following are Rust packages which could be installed using cargo:
nushell
ruff
starship
uutils
uv (from git not crates.io because of reliance on unpublished crates)
wezterm
zoxide

### TODO List

- Learn how to use defaults to record and restore System Preferences and other MacOS configurations.
- Automate symlinking and run script files with a bootstrapping tool like Dotbot.
- Revisit the list in .zshrc to customize the shell.
- Make a checklist of steps to decommission your computer before wiping your hard drive.
- Create a bootable USB installer for macOS.
- Integrate other cloud services into your Dotfiles process (Dropbox, OneDrive, etc.).
- Find inspiration and examples in other Dotfiles repositories at dotfiles.github.io.
