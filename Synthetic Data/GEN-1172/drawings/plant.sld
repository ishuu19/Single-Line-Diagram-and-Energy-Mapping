sld "GEN-1172 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-447", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1641", rating: "280 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-365", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-791", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1046", rating: "kW / kWh"]
f1cb = breaker [label: "CB-333", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-787", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1062", rating: "kW / kWh"]
f1pnl = hub [label: "FD-929", rating: "3P+N"]
f1l1cb = breaker [label: "CB-395", rating: "MCCB / 50 A / 3P"]
f1l1m = motor [label: "MTR-1133", rating: "23 kW / COND"]
f1l2cb = breaker [label: "CB-334", rating: "MCCB / 63 A / 3P"]
f1l2drv = vfd [label: "DRV-850", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1197", rating: "31 kW / PROC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
mctA1 -> mpmA1
f1ct -> f1pm
