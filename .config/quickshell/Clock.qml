import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import qs.Theme

Pill {
    id: clockPill
    implicitWidth: timeLabel.implicitWidth + 32
    Layout.rightMargin: 16

    BarText {
        id: timeLabel
        interactive: true
        property bool showDate: false

        anchors.centerIn: parent
        color: Theme.colour1
        text: {
            if (!timeLabel.showDate) {
                Qt.formatTime(new Date(), "HH:mm:ss")
            } else {
                Qt.formatTime(new Date(), "HH:mm")
            }
        }

        onClicked: timeLabel.showDate = !timeLabel.showDate
    }
    
    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            if (!timeLabel.showDate) {
                timeLabel.text = Qt.formatTime(new Date(), "HH:mm:ss")
            } else {
                timeLabel.text = Qt.formatTime(new Date(), "HH:mm")
            }
        }
    }
}
