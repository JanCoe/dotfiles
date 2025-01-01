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
dirs add ~/.config
dirs add ~/Projects
dirs add ~/Projects/lpi_alm
dirs add ~

# No welcoming banner
$env.config.show_banner = false

# Command prompt
$env.PROMPT_COMMAND_RIGHT = {|| date now | format date '%H:%M:%S' }

# Set path
const gitbash = 'C:\Program Files\Git\usr\bin'
if $nu.os-info.name == "windows" {
    $env.Path = ($env.Path | prepend $gitbash)
}

if not ($env.Path | any {|it| $it == "/opt/bin" }) {
   $env.Path ++= ["/opt/bin"]
}

# Editing modes
$env.config.edit_mode = "vi"
$env.config.buffer_editor = "vi" 

