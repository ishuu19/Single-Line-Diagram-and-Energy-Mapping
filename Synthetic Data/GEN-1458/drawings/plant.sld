sld "GEN-1458 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-477", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
mcbA1 = breaker [label: "CB-345", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-781", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1004", rating: "kW / kWh"]
f1cb = breaker [label: "CB-338", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-789", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1019", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-361", rating: "MCCB / 20 A / 3P"]
f1l1m = motor [label: "MTR-1105", rating: "9 kW / EF"]
f2cb = breaker [label: "CB-358", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-785", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
f2pnl = hub [label: "FD-900", rating: "3P+N"]
f2l1cb = breaker [label: "CB-393", rating: "MCCB / 80 A / 3P"]
f2l1drv = vfd [label: "DRV-846", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1144", rating: "38 kW / COMP"]
f2l2ld = load [label: "PNL-1411", rating: "DOCK PANEL / 35 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
