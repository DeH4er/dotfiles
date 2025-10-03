import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

RowLayout {
    id: layout
    spacing: 5
    y: 5
    x: 5

    Repeater {
        model: Hyprland.workspaces

        Rectangle {
            id: workspace
            required property var modelData
            color: modelData.active ? Color.rosewater : "transparent"
            radius: 5

            implicitWidth: 40
            implicitHeight: 30

            Item {
                visible: workspace.modelData.urgent
                anchors.centerIn: parent
                implicitHeight: 4
                implicitWidth: 4

                Rectangle {
                    x: 7
                    y: -8
                    color: Color.red2
                    implicitHeight: 4
                    implicitWidth: 4
                    radius: 9999
                }
            }

            Text {
                id: child
                text: workspace.modelData.name
                anchors.centerIn: parent
                color: Color.base
            }
        }
    }
}
