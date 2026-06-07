import Quickshell
import "panel"
import "menu"

ShellRoot {
    id: root

    Variants {
        model: Quickshell.screens

        Panel {}
    }

    SystemMenu {}
}
