if not ($env.PATH | any {|it| $it == "~/.cargo/bin" }) {
    $env.PATH ++= ["~/.cargo/bin"]
}
$env.STARSHIP_CONFIG = $"($nu.home-path)/.config/starship/starship.toml"
$env.BAT_PAGER = "less"

zoxide init nushell | save -f ~/.zoxide.nu
