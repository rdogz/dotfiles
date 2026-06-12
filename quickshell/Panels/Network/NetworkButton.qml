import QtQuick
import "../../Theme"
import "../../Common"
import "../../Services"
import "../../Bar"

// Bar wifi button → toggles the Network panel. Mirrors the ControlCenter /
// NotificationButton pattern: owns an `open` state the bar wires to
// NetworkPanel and stays highlighted while open. Dims when no active
// connection so the user can tell at a glance.
BarButton {
    id: root

    property bool open: false
    active: open

    onClicked: root.open = !root.open

    Icon {
        anchors.verticalCenter: parent.verticalCenter
        code: 0xef44 // nf-fa-wifi
        opacity: NetworkService.ethernetState === "connected" ? 1.0 : (NetworkService.ethernetDevice !== "" ? 0.55 : 0.35)
    }
}
