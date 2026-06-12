import QtQuick
import QtQuick.Layouts
import "../Theme"
import "../Common"
import "../Services"

RowLayout {
    spacing: 6

    // CPU usage
    Icon {
        Layout.alignment: Qt.AlignVCenter
        code: 0xe266 // nf-md-cpu_64_bit
        size: 13
        color: SystemStatsService.cpuUsage > 80 ? Theme.error : Theme.textDim
    }
    Text {
        Layout.alignment: Qt.AlignVCenter
        text: SystemStatsService.cpuUsage + "%"
        font.family: Theme.fonts.mono
        font.pixelSize: 12
        color: SystemStatsService.cpuUsage > 80 ? Theme.error : Theme.text
    }

    Item { implicitWidth: 4 }

    // CPU temp
    Icon {
        Layout.alignment: Qt.AlignVCenter
        code: 0xf2c9 // nf-fa-thermometer
        size: 13
        color: SystemStatsService.cpuTemp > 85 ? Theme.error : Theme.textDim
    }
    Text {
        Layout.alignment: Qt.AlignVCenter
        text: SystemStatsService.cpuTemp + "°C"
        font.family: Theme.fonts.mono
        font.pixelSize: 12
        color: SystemStatsService.cpuTemp > 85 ? Theme.error : Theme.text
    }

    Item { implicitWidth: 4 }

    // RAM
    Icon {
        Layout.alignment: Qt.AlignVCenter
        code: 0xefc5 // nf-md-memory
        size: 13
        color: SystemStatsService.ramUsage > 85 ? Theme.error : Theme.textDim
    }
    Text {
        Layout.alignment: Qt.AlignVCenter
        text: SystemStatsService.ramUsage + "%"
        font.family: Theme.fonts.mono
        font.pixelSize: 12
        color: SystemStatsService.ramUsage > 85 ? Theme.error : Theme.text
    }
}
