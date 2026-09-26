sld "GEN-1430 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-423", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1693", rating: "690 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-337", rating: "MCCB / 1000 A / 3P"]
mctA1 = ct [label: "TA-741", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f1cb = breaker [label: "CB-303", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-714", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1003", rating: "kW / kWh"]
f1pnl = hub [label: "FD-965", rating: "3P+N"]
f1l1ld = load [label: "PNL-1463", rating: "PRESS FLOOR PANEL / 38 kW"]
f1l2ld = load [label: "PNL-1416", rating: "SHOP LIGHTING / 19 kW"]
f2cb = breaker [label: "CB-394", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-736", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1037", rating: "kW / kWh"]
f2pnl = hub [label: "FD-958", rating: "3P+N"]
f2l1ld = load [label: "PNL-1403", rating: "PRESS FLOOR PANEL / 25 kW"]
f2l2ld = load [label: "PNL-1488", rating: "AUXILIARY PANEL / 25 kW"]
f3cb = breaker [label: "CB-328", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-707", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-361", rating: "MCCB / 63 A / 3P"]
f3l1drv = vfd [label: "DRV-819", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1188", rating: "29 kW / PROC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
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
