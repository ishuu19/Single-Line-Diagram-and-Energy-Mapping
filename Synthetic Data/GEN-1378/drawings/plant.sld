sld "GEN-1378 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-480", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1693", rating: "2080 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-343", rating: "ACB / 3000 A / 3P"]
mctA1 = ct [label: "TA-712", rating: "3 CTs / 3000/5 A"]
mpmA1 = watthour_meter [label: "PM-1038", rating: "kW / kWh"]
f1cb = breaker [label: "CB-384", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-786", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1076", rating: "kW / kWh"]
f1pnl = hub [label: "FD-949", rating: "3P+N"]
f1l1ld = load [label: "PNL-1481", rating: "AUXILIARY PANEL / 277 kW"]
f1l2cb = breaker [label: "CB-358", rating: "MCCB / 500 A / 3P"]
f1l2drv = vfd [label: "DRV-834", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1133", rating: "237 kW / MILL"]
f2cb = breaker [label: "CB-307", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-718", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1011", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1476", rating: "MCC AUXILIARY BOARD / 86 kW"]
f3cb = breaker [label: "CB-349", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-750", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1060", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-366", rating: "MCCB / 800 A / 3P"]
f3l1drv = vfd [label: "DRV-848", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1103", rating: "355 kW / MILL"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
