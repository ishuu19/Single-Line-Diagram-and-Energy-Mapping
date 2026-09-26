sld "GEN-1057 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-478", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
mcbA1 = breaker [label: "CB-327", rating: "MCCB / 630 A / 3P"]
mctA1 = ct [label: "TA-769", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1053", rating: "kW / kWh"]
f1cb = breaker [label: "CB-326", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-771", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1000", rating: "kW / kWh"]
f1pnl = hub [label: "FD-956", rating: "3P+N"]
f1l1cb = breaker [label: "CB-354", rating: "MCCB / 40 A / 3P"]
f1l1m = motor [label: "MTR-1144", rating: "21 kW / EF"]
f1l2ld = load [label: "PNL-1493", rating: "FLOOR LIGHTING / 43 kW"]
f2cb = breaker [label: "CB-376", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-791", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1090", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-352", rating: "MCCB / 63 A / 3P"]
f2l1drv = vfd [label: "DRV-828", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1190", rating: "35 kW / CRAC"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
