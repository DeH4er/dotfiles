import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Controls

WrapperMouseArea {
    id: root
    hoverEnabled: true
    required property PanelWindow panel
    property var iconSize: 40
    property var iconSpacing: 5
    property var marginRight: 20

    Item {
        implicitHeight: 40
        implicitWidth: 40

        IconButton {
            icon: Icon.volume2
        }

        WrapperMouseArea {
            id: mouse2
            hoverEnabled: true
            x: -width / 2 + root.iconSize / 2
            y: root.iconSize
            implicitHeight: 150
            implicitWidth: 80

            Rectangle {
                visible: root.containsMouse || mouse2.containsMouse
                color: Color.red

                Slider {
                    anchors.verticalCenter: parent.verticalCenter
                    orientation: Qt.Vertical
                    x: mouse2.width / 2 - width / 2
                    implicitHeight: 120
                }
            }
        }

        // PopupWindow {
        //     anchor.window: panel
        //     anchor.rect.x: panel.width - marginRight - iconSize * 2 - iconSpacing - width / 2 + iconSize / 2
        //     anchor.rect.y: panel.height
        //     height: 150
        //     width: 100
        //     visible: mouse.containsMouse
        //     color: "red"
        //     // visible: mouse.containsMouse
        //     // y: 35
        // }
    }
}
