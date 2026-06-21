import QtQuick
import Quickshell.Io

Item {
    id: root 

    property string value: "Linux"

    Process {
        id: kernelProc
        command: ["uname", "-r"]
        stdout: SplitParser {
            onRead: data => {
                if (data) root.value = data.trim()
            }
        }
        Component.onCompleted: running = true
    }
}
