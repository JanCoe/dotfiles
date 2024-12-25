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

$env.config.show_banner = false

$env.config.buffer_editor = "vi" 

const gitbash = 'C:\Program Files\Git\usr\bin'
if $nu.os-info.name == "windows" {
    $env.Path = ($env.Path | prepend $gitbash)
}
$env.Path ++= ["/opt/bin"]

