sld "GEN-1106 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-427", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
mcbA1 = breaker [label: "CB-386", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-768", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
f1cb = breaker [label: "CB-362", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-748", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1081", rating: "kW / kWh"]
f1pnl = hub [label: "FD-906", rating: "3P+N"]
f1l1ld = load [label: "PNL-1423", rating: "AUXILIARY PANEL / 30 kW"]
f1l2ld = load [label: "PNL-1421", rating: "DOSING PANEL / 40 kW"]
f2cb = breaker [label: "CB-309", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-795", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1017", rating: "kW / kWh"]
f2pnl = hub [label: "FD-925", rating: "3P+N"]
f2l1cb = breaker [label: "CB-322", rating: "MCCB / 160 A / 3P"]
f2l1drv = vfd [label: "DRV-886", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1185", rating: "70 kW / RWP"]
f2l2cb = breaker [label: "CB-397", rating: "MCCB / 100 A / 3P"]
f2l2drv = vfd [label: "DRV-843", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1174", rating: "45 kW / BLOW"]
f3cb = breaker [label: "CB-339", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-735", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1095", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1457", rating: "DOSING PANEL / 36 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
f2pnl -> f2l2cb
f2l2cb -> f2l2drv
f2l2drv -> f2l2m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
