sld "GEN-0920 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-469", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1697", rating: "690 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-353", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-736", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
f1cb = breaker [label: "CB-308", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-702", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1000", rating: "kW / kWh"]
f1pnl = hub [label: "FD-995", rating: "3P+N"]
f1l1cb = breaker [label: "CB-328", rating: "MCCB / 50 A / 3P"]
f1l1m = motor [label: "MTR-1126", rating: "23 kW / COMP"]
f1l2ld = load [label: "PNL-1431", rating: "CELLAR PANEL / 10 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2ld
mctA1 -> mpmA1
f1ct -> f1pm
