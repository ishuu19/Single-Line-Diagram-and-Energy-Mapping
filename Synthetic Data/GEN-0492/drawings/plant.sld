sld "GEN-0492 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-404", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1692", rating: "550 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-391", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-784", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1044", rating: "kW / kWh"]
f1cb = breaker [label: "CB-355", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-715", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1022", rating: "kW / kWh"]
f1pnl = hub [label: "FD-956", rating: "3P+N"]
f1l1cb = breaker [label: "CB-331", rating: "MCCB / 63 A / 3P"]
f1l1drv = vfd [label: "DRV-878", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1144", rating: "26 kW / CRAC"]
f1l2cb = breaker [label: "CB-360", rating: "MCCB / 16 A / 3P"]
f1l2m = motor [label: "MTR-1172", rating: "7 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2m
mctA1 -> mpmA1
f1ct -> f1pm
