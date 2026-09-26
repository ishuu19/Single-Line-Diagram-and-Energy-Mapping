sld "GEN-1492 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-455", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1645", rating: "280 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-372", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-712", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1060", rating: "kW / kWh"]
f1cb = breaker [label: "CB-338", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-723", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1087", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1409", rating: "SHOP LIGHTING / 31 kW"]
f2cb = breaker [label: "CB-309", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-758", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
f2pnl = hub [label: "FD-985", rating: "3P+N"]
f2l1ld = load [label: "PNL-1450", rating: "AUXILIARY PANEL / 82 kW"]
f2l2cb = breaker [label: "CB-333", rating: "MCCB / 160 A / 3P"]
f2l2drv = vfd [label: "DRV-840", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1166", rating: "79 kW / PROC"]
f3cb = breaker [label: "CB-320", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-778", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1058", rating: "kW / kWh"]
f3pnl = hub [label: "FD-946", rating: "3P+N"]
f3l1ld = load [label: "PNL-1414", rating: "SHOP AUXILIARIES / 23 kW"]
f3l2ld = load [label: "PNL-1438", rating: "SHOP AUXILIARIES / 32 kW"]

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
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
