sld "GEN-1550 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-455", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1627", rating: "580 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-395", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-784", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1091", rating: "kW / kWh"]
srcA2 = generator [label: "STANDBY GENERATOR", voltage: "208Y/120V", rating: "260 kW"]
mcbA2 = breaker [label: "CB-333", rating: "ACB / 800 A / 3P"]
mctA2 = ct [label: "TA-798", rating: "3 CTs / 800/5 A"]
mpmA2 = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
f1cb = breaker [label: "CB-355", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-720", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
f1pnl = hub [label: "FD-965", rating: "3P+N"]
f1l1cb = breaker [label: "CB-339", rating: "MCCB / 25 A / 3P"]
f1l1m = motor [label: "MTR-1141", rating: "6 kW / EF"]
f1l2ld = load [label: "PNL-1493", rating: "DOCK LIGHTING / 22 kW"]
f2cb = breaker [label: "CB-334", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-718", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1497", rating: "SHORE POWER PANEL / 76 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
