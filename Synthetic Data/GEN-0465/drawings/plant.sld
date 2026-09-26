sld "GEN-0465 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-485", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1665", rating: "440 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-329", rating: "MCCB / 630 A / 3P"]
mctA1 = ct [label: "TA-708", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1054", rating: "kW / kWh"]
f1cb = breaker [label: "CB-346", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-744", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1050", rating: "kW / kWh"]
f1pnl = hub [label: "FD-997", rating: "3P+N"]
f1l1ld = load [label: "PNL-1432", rating: "DOCK PANEL / 24 kW"]
f1l2ld = load [label: "PNL-1484", rating: "DOCK PANEL / 19 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
mctA1 -> mpmA1
f1ct -> f1pm
