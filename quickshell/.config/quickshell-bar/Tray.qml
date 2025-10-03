import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import Quickshell.Services.SystemTray

RowLayout {
    id: root
    spacing: 5
    required property PanelWindow panel

    Repeater {
        model: {
            SystemTray.items;
        }

        Loader {
            required property SystemTrayItem modelData

            readonly property Component steamIcon: IconButton {
                icon: Icon.gamepad2
                onClicked: modelData.display(root.panel, panel.width, 40)
            }

            readonly property Component nmAppletIcon: IconButton {
                icon: Icon.ethernetPort
                onClicked: modelData.display(root.panel, panel.width, 40)
            }

            readonly property Component dockerIcon: IconButton {
                icon: Icon.container
                onClicked: modelData.display(root.panel, panel.width, 40)
            }

            readonly property Component unknownIcon: IconButton {
                icon: Icon.gamepad2
            }

            sourceComponent: {
                if (modelData.id == "steam") {
                    return steamIcon;
                }

                if (modelData.id == "nm-applet") {
                    return nmAppletIcon;
                }

                if (modelData.id == "chrome_status_icon_1") {
                    return dockerIcon;
                }

                return unknownIcon;
            }
        }
        // WrapperMouseArea {
        //     id: trayItem
        //     required property SystemTrayItem modelData
        //     onClicked: {
        //         console.log(modelData.id);
        //         modelData.display(root.panel, panel.width, 40);
        //     }

        //     Rectangle {
        //         implicitHeight: 40
        //         implicitWidth: 40
        //         color: "red"

        //         Loader {
        //             readonly property Component unknownIcon: IconImage {
        //                 anchors.centerIn: parent
        //                 source: {
        //                     let icon = trayItem.modelData.icon;
        //                     if (icon.includes("?path=")) {
        //                         const [name, path] = icon.split("?path=");
        //                         icon = Qt.resolvedUrl(`${path}/${name.slice(name.lastIndexOf("/") + 1)}`);
        //                     }

        //                     return icon;
        //                 }
        //                 implicitSize: 28
        //             }

        //             readonly property Component steamIcon: IconButton {
        //                 // anchors.centerIn: parent
        //                 icon: Icon.gamepad2
        //             }

        //             sourceComponent: trayItem.modelData.id == "steam" ? steamIcon : unknownIcon
        //         }
        //     }
        // }

        // Rectangle {
        //     required property SystemTrayItem modelData
        //     implicitHeight: 30
        //     implicitWidth: 30
        //     color: "transparent"

        //     Image {
        //         anchors.fill: parent
        //         source: parent.modelData.icon
        //     }
        // }

        // Text {
        //     required property SystemTrayItem modelData
        //     text: modelData.
        // }
    }
}
