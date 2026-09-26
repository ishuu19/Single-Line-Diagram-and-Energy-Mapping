sld "GEN-0312 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-495", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1612", rating: "230 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-303", rating: "MCCB / 630 A / 3P"]
mctA1 = ct [label: "TA-704", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1022", rating: "kW / kWh"]
busB = bus [label: "BUS-426", voltage: "208Y/120V"]
srcB1 = utility [label: "12.47kV SUPPLY B", voltage: "12.47kV"]
txB1 = transformer_dy [label: "TX-1658", rating: "60 kVA", voltage: "12.47kV / 208Y/120V"]
mcbB1 = breaker [label: "CB-384", rating: "ACB / 160 A / 3P"]
mctB1 = ct [label: "TA-752", rating: "3 CTs / 160/5 A"]
mpmB1 = watthour_meter [label: "PM-1051", rating: "kW / kWh"]
tie = bus_tie [label: "CB-373", rating: "1600 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-343", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-707", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1089", rating: "kW / kWh"]
f1pnl = hub [label: "FD-929", rating: "3P+N"]
f1l1ld = load [label: "PNL-1451", rating: "SHELTER LIGHTING / 9 kW"]
f1l2ld = load [label: "PNL-1457", rating: "AUXILIARY PANEL / 14 kW"]
f2cb = breaker [label: "CB-367", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-716", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1018", rating: "kW / kWh"]
f2pnl = hub [label: "FD-944", rating: "3P+N"]
f2l1ld = load [label: "PNL-1493", rating: "RECTIFIER PDU / 25 kW"]
f2l2ld = load [label: "PNL-1483", rating: "RECTIFIER PDU / 27 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> txB1
txB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busB -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
