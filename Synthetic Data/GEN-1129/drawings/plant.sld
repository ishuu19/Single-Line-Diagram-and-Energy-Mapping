sld "GEN-1129 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-476", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1642", rating: "1390 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-338", rating: "MCCB / 2000 A / 3P"]
mctA1 = ct [label: "TA-724", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1020", rating: "kW / kWh"]
f1cb = breaker [label: "CB-357", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-780", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f1pnl = hub [label: "FD-900", rating: "3P+N"]
f1l1ld = load [label: "PNL-1418", rating: "CELLAR PANEL / 24 kW"]
f1l2ld = load [label: "PNL-1491", rating: "CELLAR PANEL / 11 kW"]
f2cb = breaker [label: "CB-318", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-781", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-394", rating: "MCCB / 50 A / 3P"]
f2l1m = motor [label: "MTR-1189", rating: "20 kW / COMP"]

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
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
