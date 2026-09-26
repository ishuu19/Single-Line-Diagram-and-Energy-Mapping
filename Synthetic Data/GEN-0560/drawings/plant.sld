sld "GEN-0560 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-435", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1681", rating: "440 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-378", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-726", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1057", rating: "kW / kWh"]
f1cb = breaker [label: "CB-356", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-748", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1014", rating: "kW / kWh"]
f1pnl = hub [label: "FD-955", rating: "3P+N"]
f1l1ld = load [label: "PNL-1414", rating: "SHOP LIGHTING / 13 kW"]
f1l2cb = breaker [label: "CB-310", rating: "MCCB / 80 A / 3P"]
f1l2drv = vfd [label: "DRV-849", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1116", rating: "35 kW / PROC"]
f2cb = breaker [label: "CB-360", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-769", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1078", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1492", rating: "SHOP LIGHTING / 17 kW"]
f3cb = breaker [label: "CB-330", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-728", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1401", rating: "PRESS FLOOR PANEL / 20 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
