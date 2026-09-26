sld "GEN-0748 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-415", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
mcbA1 = breaker [label: "CB-358", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-707", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1047", rating: "kW / kWh"]
f1cb = breaker [label: "CB-331", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-760", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
f1pnl = hub [label: "FD-941", rating: "3P+N"]
f1l1ld = load [label: "PNL-1462", rating: "PRESS FLOOR PANEL / 24 kW"]
f1l2ld = load [label: "PNL-1401", rating: "SHOP LIGHTING / 14 kW"]

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
