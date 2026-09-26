sld "GEN-1534 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-449", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
mcbA1 = breaker [label: "CB-379", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-726", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
f1cb = breaker [label: "CB-334", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-717", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1054", rating: "kW / kWh"]
f1pnl = hub [label: "FD-906", rating: "3P+N"]
f1l1ld = load [label: "PNL-1427", rating: "CELLAR PANEL / 13 kW"]
f1l2cb = breaker [label: "CB-359", rating: "MCCB / 125 A / 3P"]
f1l2m = motor [label: "MTR-1185", rating: "26 kW / COND"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2m
mctA1 -> mpmA1
f1ct -> f1pm
