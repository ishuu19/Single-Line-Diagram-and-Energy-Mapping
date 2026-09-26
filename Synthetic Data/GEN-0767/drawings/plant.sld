sld "GEN-0767 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-485", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
mcbA1 = breaker [label: "CB-311", rating: "MCCB / 2000 A / 3P"]
mctA1 = ct [label: "TA-732", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
f1cb = breaker [label: "CB-320", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-769", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
f1pnl = hub [label: "FD-994", rating: "3P+N"]
f1l1ld = load [label: "PNL-1498", rating: "RISER PANEL / 50 kW"]
f1l2ld = load [label: "PNL-1462", rating: "COMMON AREA LIGHTING / 34 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
mctA1 -> mpmA1
f1ct -> f1pm
