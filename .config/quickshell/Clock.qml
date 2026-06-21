import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import "workspaces"

Rectangle {
    id: clockPill
    width: 100
    height: 28
    radius: height / 2

    color: Qt.rgba(0, 0, 0, 0.55)
    border.color: Qt.rgba(1, 1, 1, 0.35)
    border.width: 1

    Text {
        id: timeLabel
        property bool interactive: true
        property bool showDate: false
        signal clicked()

        anchors.centerIn: parent
        color: "grey"
        font.pixelSize: 18
        font.family: "Inter"
        text: {
            if (!timeLabel.showDate) {
                Qt.formatTime(new Date(), "HH:mm:ss")
            } else {
                Qt.formatTime(new Date(), "HH:mm")
            }
        }

        MouseArea {
            anchors.fill: parent
            enabled: timeLabel.interactive
            cursorShape: timeLabel.interactive ? Qt.PointingHandCursor : Qt.ArrowCursor
            onClicked: timeLabel.clicked()
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
