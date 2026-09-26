sld "GEN-1165 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-429", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1695", rating: "1110 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-397", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-755", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1051", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 172 kW", voltage: "400Y/230V"]
mcbA2 = breaker [label: "CB-309", rating: "MCCB / 160 A / 3P"]
mctA2 = ct [label: "TA-754", rating: "3 CTs / 160/5 A"]
mpmA2 = watthour_meter [label: "PM-1088", rating: "kW / kWh"]
f1cb = breaker [label: "CB-356", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-703", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1054", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1492", rating: "SITE LIGHTING / 30 kW"]
f2cb = breaker [label: "CB-387", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-769", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1013", rating: "kW / kWh"]
f2pnl = hub [label: "FD-988", rating: "3P+N"]
f2l1ld = load [label: "PNL-1417", rating: "SITE LIGHTING / 28 kW"]
f2l2ld = load [label: "PNL-1419", rating: "ACADEMIC BLOCK PANEL / 64 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
