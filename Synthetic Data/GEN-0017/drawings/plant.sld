sld "GEN-0017 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-432", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1652", rating: "550 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-317", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-774", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1062", rating: "kW / kWh"]
f1cb = breaker [label: "CB-388", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-726", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1088", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1426", rating: "AUXILIARY PANEL / 49 kW"]
f2cb = breaker [label: "CB-308", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-723", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1020", rating: "kW / kWh"]
f2pnl = hub [label: "FD-911", rating: "3P+N"]
f2l1ld = load [label: "PNL-1476", rating: "DOSING PANEL / 40 kW"]
f2l2cb = breaker [label: "CB-351", rating: "MCCB / 80 A / 3P"]
f2l2drv = vfd [label: "DRV-853", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1132", rating: "39 kW / RWP"]
f3cb = breaker [label: "CB-364", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-750", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-366", rating: "MCCB / 63 A / 3P"]
f3l1drv = vfd [label: "DRV-890", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1164", rating: "29 kW / BLOW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2cb
f2l2cb -> f2l2drv
f2l2drv -> f2l2m
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
