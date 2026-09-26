sld "GEN-0612 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-493", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1677", rating: "280 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-339", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-730", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1060", rating: "kW / kWh"]
f1cb = breaker [label: "CB-329", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-700", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1011", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-372", rating: "MCCB / 100 A / 3P"]
f1l1drv = vfd [label: "DRV-871", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1140", rating: "42 kW / PROC"]
f2cb = breaker [label: "CB-384", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-746", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1095", rating: "kW / kWh"]
f2pnl = hub [label: "FD-964", rating: "3P+N"]
f2l1ld = load [label: "PNL-1475", rating: "CELLAR PANEL / 16 kW"]
f2l2cb = breaker [label: "CB-349", rating: "MCCB / 25 A / 3P"]
f2l2m = motor [label: "MTR-1183", rating: "11 kW / COND"]
f3cb = breaker [label: "CB-356", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-770", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1435", rating: "CELLAR PANEL / 24 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2cb
f2l2cb -> f2l2m
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
