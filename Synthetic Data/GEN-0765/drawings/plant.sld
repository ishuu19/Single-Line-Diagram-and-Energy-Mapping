sld "GEN-0765 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-485", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1630", rating: "550 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-344", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-746", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
f1cb = breaker [label: "CB-367", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-706", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f1pnl = hub [label: "FD-918", rating: "3P+N"]
f1l1cb = breaker [label: "CB-316", rating: "MCCB / 100 A / 3P"]
f1l1m = motor [label: "MTR-1124", rating: "42 kW / COMP"]
f1l2ld = load [label: "PNL-1482", rating: "AUXILIARY PANEL / 87 kW"]
f2cb = breaker [label: "CB-338", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-715", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-308", rating: "MCCB / 100 A / 3P"]
f2l1drv = vfd [label: "DRV-858", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1117", rating: "42 kW / PROC"]
f3cb = breaker [label: "CB-345", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-721", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1025", rating: "kW / kWh"]
f3pnl = hub [label: "FD-976", rating: "3P+N"]
f3l1ld = load [label: "PNL-1410", rating: "SHOP AUXILIARIES / 44 kW"]
f3l2ld = load [label: "PNL-1489", rating: "SHOP LIGHTING / 33 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
