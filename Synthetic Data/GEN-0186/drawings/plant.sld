sld "GEN-0186 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-468", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1679", rating: "90 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-389", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-709", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1042", rating: "kW / kWh"]
f1cb = breaker [label: "CB-328", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-740", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
f1pnl = hub [label: "FD-975", rating: "3P+N"]
f1l1ld = load [label: "PNL-1419", rating: "DOCK LIGHTING / 24 kW"]
f1l2ld = load [label: "PNL-1451", rating: "SHORE POWER PANEL / 44 kW"]
f2cb = breaker [label: "CB-387", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-702", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1030", rating: "kW / kWh"]
f2pnl = hub [label: "FD-916", rating: "3P+N"]
f2l1ld = load [label: "PNL-1445", rating: "SHORE POWER PANEL / 45 kW"]
f2l2cb = breaker [label: "CB-322", rating: "MCCB / 32 A / 3P"]
f2l2m = motor [label: "MTR-1184", rating: "8 kW / EF"]

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
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2cb
f2l2cb -> f2l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
