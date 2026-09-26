sld "GEN-0162 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-411", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1699", rating: "440 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-309", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-706", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1053", rating: "kW / kWh"]
f1cb = breaker [label: "CB-312", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-782", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1060", rating: "kW / kWh"]
f1pnl = hub [label: "FD-976", rating: "3P+N"]
f1l1cb = breaker [label: "CB-330", rating: "MCCB / 50 A / 3P"]
f1l1m = motor [label: "MTR-1147", rating: "21 kW / COND"]
f1l2ld = load [label: "PNL-1423", rating: "CELLAR PANEL / 24 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2ld
mctA1 -> mpmA1
f1ct -> f1pm
