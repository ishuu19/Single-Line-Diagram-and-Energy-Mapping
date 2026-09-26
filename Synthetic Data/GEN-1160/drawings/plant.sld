sld "GEN-1160 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-476", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1673", rating: "720 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-357", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-783", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1019", rating: "kW / kWh"]
f1cb = breaker [label: "CB-330", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-776", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1437", rating: "PRESS FLOOR PANEL / 18 kW"]
f2cb = breaker [label: "CB-369", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-720", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1034", rating: "kW / kWh"]
f2pnl = hub [label: "FD-941", rating: "3P+N"]
f2l1ld = load [label: "PNL-1427", rating: "PRESS FLOOR PANEL / 40 kW"]
f2l2cb = breaker [label: "CB-378", rating: "MCCB / 160 A / 3P"]
f2l2drv = vfd [label: "DRV-803", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1184", rating: "34 kW / PROC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2cb
f2l2cb -> f2l2drv
f2l2drv -> f2l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
