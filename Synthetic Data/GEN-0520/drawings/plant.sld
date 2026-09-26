sld "GEN-0520 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-415", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
mcbA1 = breaker [label: "CB-311", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-781", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
f1cb = breaker [label: "CB-366", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-739", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
f1pnl = hub [label: "FD-955", rating: "3P+N"]
f1l1ld = load [label: "PNL-1442", rating: "SHOP LIGHTING / 12 kW"]
f1l2cb = breaker [label: "CB-303", rating: "MCCB / 32 A / 3P"]
f1l2drv = vfd [label: "DRV-830", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1146", rating: "16 kW / PROC"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
mctA1 -> mpmA1
f1ct -> f1pm
