sld "GEN-1331 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-461", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1628", rating: "230 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-316", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-782", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1057", rating: "kW / kWh"]
f1cb = breaker [label: "CB-350", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-795", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1076", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-346", rating: "MCCB / 63 A / 3P"]
f1l1m = motor [label: "MTR-1104", rating: "13 kW / EF"]
f2cb = breaker [label: "CB-340", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-754", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1094", rating: "kW / kWh"]
f2pnl = hub [label: "FD-991", rating: "3P+N"]
f2l1cb = breaker [label: "CB-315", rating: "MCCB / 63 A / 3P"]
f2l1m = motor [label: "MTR-1103", rating: "13 kW / EF"]
f2l2ld = load [label: "PNL-1462", rating: "ADMIN PANEL / 43 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1m
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
