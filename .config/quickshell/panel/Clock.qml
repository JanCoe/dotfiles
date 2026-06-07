import QtQuick
import QtQuick.Layouts
import qs.Theme
import qs.Assets

BarText {
    id: clock

    text: Qt.formatDateTime(new Date(), "ddd, dd MMM - HH:mm")
    color: Theme.foreground1

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: clock.text = Qt.formatDateTime(new Date(), "ddd, dd MMM - HH:mm")
    }
}
