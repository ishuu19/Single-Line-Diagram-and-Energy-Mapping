sld "GEN-1228 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-410", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1662", rating: "720 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-360", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-725", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1097", rating: "kW / kWh"]
f1cb = breaker [label: "CB-397", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-770", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1056", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1435", rating: "SHOP LIGHTING / 13 kW"]
f2cb = breaker [label: "CB-345", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-743", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1078", rating: "kW / kWh"]
f2pnl = hub [label: "FD-949", rating: "3P+N"]
f2l1ld = load [label: "PNL-1493", rating: "PRESS FLOOR PANEL / 34 kW"]
f2l2ld = load [label: "PNL-1423", rating: "PRESS FLOOR PANEL / 24 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
