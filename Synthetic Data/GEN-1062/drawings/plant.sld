sld "GEN-1062 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-499", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
mcbA1 = breaker [label: "CB-351", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-702", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
f1cb = breaker [label: "CB-329", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-787", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1047", rating: "kW / kWh"]
f1pnl = hub [label: "FD-933", rating: "3P+N"]
f1l1cb = breaker [label: "CB-318", rating: "MCCB / 125 A / 3P"]
f1l1m = motor [label: "MTR-1181", rating: "31 kW / COMP"]
f1l2cb = breaker [label: "CB-316", rating: "MCCB / 250 A / 3P"]
f1l2drv = vfd [label: "DRV-892", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1147", rating: "63 kW / PROC"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
mctA1 -> mpmA1
f1ct -> f1pm
