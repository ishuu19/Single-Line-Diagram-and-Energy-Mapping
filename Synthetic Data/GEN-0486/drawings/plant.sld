sld "GEN-0486 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-401", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1647", rating: "1080 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-344", rating: "ACB / 3000 A / 3P"]
mctA1 = ct [label: "TA-765", rating: "3 CTs / 3000/5 A"]
mpmA1 = watthour_meter [label: "PM-1094", rating: "kW / kWh"]
f1cb = breaker [label: "CB-376", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-779", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1033", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-304", rating: "MCCB / 1000 A / 3P"]
f1l1drv = vfd [label: "DRV-806", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1109", rating: "433 kW / MILL"]
f2cb = breaker [label: "CB-353", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-712", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1000", rating: "kW / kWh"]
f2pnl = hub [label: "FD-994", rating: "3P+N"]
f2l1ld = load [label: "PNL-1494", rating: "MCC AUXILIARY BOARD / 57 kW"]
f2l2cb = breaker [label: "CB-368", rating: "MCCB / 1000 A / 3P"]
f2l2drv = vfd [label: "DRV-809", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1126", rating: "532 kW / MILL"]

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
f2pnl -> f2l2cb
f2l2cb -> f2l2drv
f2l2drv -> f2l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
