sld "GEN-0007 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-464", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1636", rating: "670 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-352", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-743", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1015", rating: "kW / kWh"]
f1cb = breaker [label: "CB-377", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-723", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1069", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-360", rating: "MCCB / 63 A / 3P"]
f1l1drv = vfd [label: "DRV-856", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1118", rating: "35 kW / PROC"]
f2cb = breaker [label: "CB-310", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-720", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1058", rating: "kW / kWh"]
f2pnl = hub [label: "FD-964", rating: "3P+N"]
f2l1ld = load [label: "PNL-1448", rating: "PRESS FLOOR PANEL / 20 kW"]
f2l2ld = load [label: "PNL-1431", rating: "PRESS FLOOR PANEL / 31 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
