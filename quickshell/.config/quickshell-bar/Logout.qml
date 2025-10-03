import Quickshell.Io
import QtQuick
import Quickshell.Widgets

WrapperMouseArea {
    id: mouse
    cursorShape: Qt.PointingHandCursor
    onClicked: logoutProcess.running = true
    hoverEnabled: true

    Rectangle {
        id: rect
        color: Color.red
        implicitWidth: 60
        implicitHeight: 40

        states: [
            State {
                name: "clicked"
                when: mouse.pressed
                PropertyChanges {
                    rect.color: Color.flamingo
                }
            },
            State {
                name: "hovered"
                when: mouse.containsMouse
                PropertyChanges {
                    rect.color: Color.rosewater
                }
            }
        ]

        Behavior on color {
            AnimateColor {}
        }

        Text {
            text: "󰣇"
            color: Color.base
            anchors.centerIn: parent
        }
    }

    Process {
        id: logoutProcess
        command: ['wlogout', '--protocol', 'layer-shell', '-b', '2']
    }
}
