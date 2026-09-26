sld "GEN-1004 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-460", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1648", rating: "1390 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-348", rating: "MCCB / 2000 A / 3P"]
mctA1 = ct [label: "TA-787", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1029", rating: "kW / kWh"]
f1cb = breaker [label: "CB-359", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-782", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f1pnl = hub [label: "FD-957", rating: "3P+N"]
f1l1cb = breaker [label: "CB-310", rating: "MCCB / 32 A / 3P"]
f1l1drv = vfd [label: "DRV-852", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1158", rating: "13 kW / CRAC"]
f1l2cb = breaker [label: "CB-332", rating: "MCCB / 25 A / 3P"]
f1l2drv = vfd [label: "DRV-849", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1144", rating: "12 kW / CRAC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
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
