if not ($env.PATH | any {|it| $it == "~/.cargo/bin" }) {
    $env.PATH ++= ["~/.cargo/bin"]
}

zoxide init nushell | save -f ~/.zoxide.nu
