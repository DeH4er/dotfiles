import Quickshell.Widgets
import Quickshell.Io
import QtQuick

WrapperItem {
    IconButton {
        icon: Icon.bell
        onClicked: notificationProcess.running = true
    }

    Process {
        id: notificationProcess
        command: ['swaync-client', '-t', '-sw']
    }
}
