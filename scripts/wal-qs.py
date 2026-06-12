#!/usr/bin/env python3
import colorsys, json, os
from pathlib import Path

wal = json.loads((Path.home() / ".cache/wal/colors.json").read_text())
c = wal["colors"]
s = wal["special"]

def h(x): return x.lstrip("#").lower()

def accent(colors):
    best, best_s = colors[1], 0.0
    for x in colors[1:7]:
        hx = h(x)
        r, g, b = (int(hx[i:i+2], 16) / 255 for i in (0, 2, 4))
        _, sat, _ = colorsys.rgb_to_hsv(r, g, b)
        if sat > best_s: best_s, best = sat, x
    return h(best)

ac = accent(list(c.values()))
r, g, b = (int(ac[i:i+2], 16) / 255 for i in (0, 2, 4))
lum = 0.2126*r + 0.7152*g + 0.0722*b

ink = h(s["foreground"])
config = {
    "theme": {
        "palette": {
            "bg":              h(s["background"]),
            "bgAlpha":         0.9,
            "surface":         h(c["color0"]),
            "ink":             ink,
            "fillBase":        ink,
            "fillAlpha":       0.08,
            "fillStrongAlpha": 0.15,
            "hairlineBase":    ink,
            "hairlineAlpha":   0.10,
            "border":          ink,
            "borderAlpha":     0.14,
            "accent":          ac,
            "accentInk":       "16121a" if lum > 0.35 else "f4f0f8",
            "error":           h(c["color1"]),
        }
    }
}

out = Path(os.environ.get("XDG_CONFIG_HOME", Path.home() / ".config")) / "quickshell/Theme/config.json"

out.parent.mkdir(parents=True, exist_ok=True)
out.write_text(json.dumps(config, indent=2))
