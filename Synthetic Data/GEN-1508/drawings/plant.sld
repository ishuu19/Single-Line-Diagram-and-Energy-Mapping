sld "GEN-1508 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-451", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
mcbA1 = breaker [label: "CB-354", rating: "MCCB / 400 A / 3P"]
mctA1 = ct [label: "TA-711", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1072", rating: "kW / kWh"]
f1cb = breaker [label: "CB-370", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-703", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1096", rating: "kW / kWh"]
f1pnl = hub [label: "FD-940", rating: "3P+N"]
f1l1cb = breaker [label: "CB-387", rating: "MCCB / 63 A / 3P"]
f1l1drv = vfd [label: "DRV-850", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1107", rating: "36 kW / AHU"]
f1l2cb = breaker [label: "CB-349", rating: "MCCB / 20 A / 3P"]
f1l2m = motor [label: "MTR-1137", rating: "11 kW / EF"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2m
mctA1 -> mpmA1
f1ct -> f1pm
