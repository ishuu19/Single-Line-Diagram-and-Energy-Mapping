sld "GEN-0569 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-429", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1671", rating: "1390 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-324", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-755", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f1cb = breaker [label: "CB-381", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-706", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1037", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1490", rating: "ADMIN PANEL / 69 kW"]
f2cb = breaker [label: "CB-345", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-768", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1091", rating: "kW / kWh"]
f2pnl = hub [label: "FD-966", rating: "3P+N"]
f2l1ld = load [label: "PNL-1450", rating: "CLASSROOM LIGHTING / 43 kW"]
f2l2cb = breaker [label: "CB-341", rating: "MCCB / 16 A / 3P"]
f2l2m = motor [label: "MTR-1147", rating: "7 kW / EF"]
f3cb = breaker [label: "CB-337", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-728", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1032", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-316", rating: "MCCB / 63 A / 3P"]
f3l1drv = vfd [label: "DRV-888", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1121", rating: "30 kW / AHU"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2cb
f2l2cb -> f2l2m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
