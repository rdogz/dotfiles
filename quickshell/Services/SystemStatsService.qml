pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property real cpuUsage: 0
    property real cpuTemp: 0
    property int ramUsage: 0

    // CPU usage: read /proc/stat twice, compute delta
    property var _prevIdle: 0
    property var _prevTotal: 0

    Process {
        id: cpuProc
        command: ["cat", "/proc/stat"]
        stdout: StdioCollector {
            onStreamFinished: {
                const line = text.split("\n")[0]; // cpu aggregate line
                const parts = line.trim().split(/\s+/).slice(1).map(Number);
                const idle = parts[3] + parts[4]; // idle + iowait
                const total = parts.reduce((a, b) => a + b, 0);
                const dIdle = idle - root._prevIdle;
                const dTotal = total - root._prevTotal;
                root.cpuUsage = dTotal > 0 ? Math.round((1 - dIdle / dTotal) * 100) : 0;
                root._prevIdle = idle;
                root._prevTotal = total;
            }
        }
    }

    Process {
        id: tempProc
        command: ["bash", "-c", "sensors 2>/dev/null | awk '/Tctl/{print $2}' | sed 's/+//; s/°C//'"]
        stdout: StdioCollector {
            onStreamFinished: {
                const val = parseFloat(text.trim());
                if (!isNaN(val)) root.cpuTemp = Math.round(val);
            }
        }
    }

    Process {
        id: ramProc
        command: ["cat", "/proc/meminfo"]
        stdout: StdioCollector {
            onStreamFinished: {
                const lines = text.split("\n");
                let total = 0, available = 0;
                for (const l of lines) {
                    if (l.startsWith("MemTotal:")) total = parseInt(l.split(/\s+/)[1]);
                    if (l.startsWith("MemAvailable:")) available = parseInt(l.split(/\s+/)[1]);
                }
                root.ramUsage = total > 0 ? Math.round((1 - available / total) * 100) : 0;
            }
        }
    }

    function poll() {
        cpuProc.running = true;
        tempProc.running = true;
        ramProc.running = true;
    }

    Timer {
        interval: 3000
        repeat: true
        running: true
        onTriggered: root.poll()
    }

    Component.onCompleted: root.poll()
}
