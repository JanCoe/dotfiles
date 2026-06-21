import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts

Rectangle {
    id: clockPill
    width: 100
    height: 28
    radius: height / 2

    color: Qt.rgba(0, 0, 0, 0.55)
    border.color: Qt.rgba(1, 1, 1, 0.35)
    border.width: 1

    BarText {
        id: timeLabel
        interactive: true
        property bool showDate: false

        anchors.centerIn: parent
        color: "grey"
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
