sld "GEN-0516 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-460", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
mcbA1 = breaker [label: "CB-352", rating: "MCCB / 1000 A / 3P"]
mctA1 = ct [label: "TA-789", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1091", rating: "kW / kWh"]
f1cb = breaker [label: "CB-340", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-763", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1099", rating: "kW / kWh"]
f1pnl = hub [label: "FD-927", rating: "3P+N"]
f1l1cb = breaker [label: "CB-303", rating: "MCCB / 40 A / 3P"]
f1l1m = motor [label: "MTR-1196", rating: "16 kW / COMP"]
f1l2ld = load [label: "PNL-1419", rating: "CELLAR PANEL / 20 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2ld
mctA1 -> mpmA1
f1ct -> f1pm
