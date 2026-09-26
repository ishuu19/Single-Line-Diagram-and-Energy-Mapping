sld "GEN-1076 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-416", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1675", rating: "1390 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-332", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-799", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1042", rating: "kW / kWh"]
f1cb = breaker [label: "CB-312", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-747", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1465", rating: "ADMIN PANEL / 41 kW"]
f2cb = breaker [label: "CB-385", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-782", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
f2pnl = hub [label: "FD-977", rating: "3P+N"]
f2l1ld = load [label: "PNL-1446", rating: "ADMIN PANEL / 33 kW"]
f2l2cb = breaker [label: "CB-365", rating: "MCCB / 50 A / 3P"]
f2l2drv = vfd [label: "DRV-840", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1106", rating: "20 kW / AHU"]
f3cb = breaker [label: "CB-380", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-796", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1461", rating: "ADMIN PANEL / 69 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2cb
f2l2cb -> f2l2drv
f2l2drv -> f2l2m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
