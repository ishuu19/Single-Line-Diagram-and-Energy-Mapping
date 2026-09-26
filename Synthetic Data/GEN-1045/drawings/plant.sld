sld "GEN-1045 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-497", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
mcbA1 = breaker [label: "CB-316", rating: "MCCB / 250 A / 3P"]
mctA1 = ct [label: "TA-791", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1073", rating: "kW / kWh"]
f1cb = breaker [label: "CB-395", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-757", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f1pnl = hub [label: "FD-929", rating: "3P+N"]
f1l1cb = breaker [label: "CB-380", rating: "MCCB / 100 A / 3P"]
f1l1m = motor [label: "MTR-1123", rating: "22 kW / COND"]
f1l2ld = load [label: "PNL-1474", rating: "PACKAGING PANEL / 22 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2ld
mctA1 -> mpmA1
f1ct -> f1pm
