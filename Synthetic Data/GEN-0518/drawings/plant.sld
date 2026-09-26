sld "GEN-0518 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-489", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1631", rating: "1390 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-323", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-745", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1058", rating: "kW / kWh"]
f1cb = breaker [label: "CB-396", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-718", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1029", rating: "kW / kWh"]
f1pnl = hub [label: "FD-921", rating: "3P+N"]
f1l1cb = breaker [label: "CB-361", rating: "MCCB / 1000 A / 3P"]
f1l1drv = vfd [label: "DRV-839", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1102", rating: "498 kW / MILL"]
f1l2cb = breaker [label: "CB-365", rating: "MCCB / 630 A / 3P"]
f1l2drv = vfd [label: "DRV-857", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1101", rating: "312 kW / MILL"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
mctA1 -> mpmA1
f1ct -> f1pm
