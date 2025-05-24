# config.nu
#
# Installed by:
# version = "0.100.1"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options

# Import modules 
use std/dirs

# Add some commonly used directories to access with 'dirs goto <num>'
# dirs add <path>

# No welcoming banner
$env.config.show_banner = false

# Set path
let path_entries = if $nu.os-info.name == "windows" {
    [ 
    "C:\\Program Files\\Git\\mingw64\\bin",
    "C:\\Program Files\\Git\\usr\\bin",
    "C:\\Users\\coetzeej\\.cargo\\bin"
    ]
} else {
    [
    "/usr/local/bin",
    "~/.local/bin",
    "/opt/bin",
    "~/.cargo/bin"
    ]
} 

for path in $path_entries {
    if not ($env.PATH | any {|it| $it == $path }) {
        $env.PATH ++= [$path]
    }
}

# Set neovim to read the man pages
$env.PAGER = "nvim"

# Editing modes
$env.config.edit_mode = "vi"
$env.config.buffer_editor = "nvim"

# General aliases
alias ll = ls -la
alias g = git
alias v = nvim
alias y = yazi
alias f = fzf
alias pic = wezterm imgcat

# cd up levels
alias .. = cd ..
alias ... = cd ../..
alias .... = cd ../../..
alias ..... = cd ../../../..

# Activate starship
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

# Source zoxide
source ~/.zoxide.nu
alias cd = z
