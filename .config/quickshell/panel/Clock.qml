import QtQuick
import QtQuick.Layouts
import "Theme.js" as Theme

BarText {
    id: clock

    text: Qt.formatDateTime(new Date(), "ddd, MMM dd - HH:mm")
    color: Theme.foreground1

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: clock.text = Qt.formatDateTime(new Date(), "ddd, MMM dd - HH:mm")
    }
}
