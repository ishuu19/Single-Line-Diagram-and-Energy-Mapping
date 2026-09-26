sld "GEN-0280 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-482", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1662", rating: "580 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-314", rating: "MCCB / 1600 A / 3P"]
mctA1 = ct [label: "TA-720", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1096", rating: "kW / kWh"]
f1cb = breaker [label: "CB-338", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-761", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
f1pnl = hub [label: "FD-945", rating: "3P+N"]
f1l1ld = load [label: "PNL-1412", rating: "SHORE POWER PANEL / 41 kW"]
f1l2cb = breaker [label: "CB-302", rating: "MCCB / 63 A / 3P"]
f1l2m = motor [label: "MTR-1103", rating: "15 kW / EF"]
f2cb = breaker [label: "CB-379", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-765", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
f2pnl = hub [label: "FD-964", rating: "3P+N"]
f2l1ld = load [label: "PNL-1408", rating: "DOCK LIGHTING / 15 kW"]
f2l2ld = load [label: "PNL-1429", rating: "DOCK LIGHTING / 13 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2m
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
