sld "GEN-0737 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-455", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1669", rating: "550 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-324", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-787", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
f1cb = breaker [label: "CB-321", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-768", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1496", rating: "DOSING PANEL / 38 kW"]
f2cb = breaker [label: "CB-335", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-705", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1060", rating: "kW / kWh"]
f2pnl = hub [label: "FD-955", rating: "3P+N"]
f2l1cb = breaker [label: "CB-377", rating: "MCCB / 125 A / 3P"]
f2l1drv = vfd [label: "DRV-820", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1168", rating: "56 kW / RWP"]
f2l2ld = load [label: "PNL-1492", rating: "DOSING PANEL / 24 kW"]
f3cb = breaker [label: "CB-364", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-733", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1067", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-318", rating: "MCCB / 80 A / 3P"]
f3l1drv = vfd [label: "DRV-823", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1185", rating: "35 kW / BLOW"]

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
f2pnl -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
