sld "GEN-0331 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-476", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1626", rating: "230 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-329", rating: "MCCB / 630 A / 3P"]
mctA1 = ct [label: "TA-727", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f1cb = breaker [label: "CB-309", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-770", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1098", rating: "kW / kWh"]
f1pnl = hub [label: "FD-907", rating: "3P+N"]
f1l1ld = load [label: "PNL-1492", rating: "DOCK LIGHTING / 10 kW"]
f1l2ld = load [label: "PNL-1472", rating: "SHORE POWER PANEL / 32 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
mctA1 -> mpmA1
f1ct -> f1pm
