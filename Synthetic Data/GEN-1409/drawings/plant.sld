sld "GEN-1409 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-465", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1636", rating: "1110 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-386", rating: "MCCB / 1600 A / 3P"]
mctA1 = ct [label: "TA-717", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1072", rating: "kW / kWh"]
f1cb = breaker [label: "CB-357", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-760", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1049", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-381", rating: "MCCB / 63 A / 3P"]
f1l1drv = vfd [label: "DRV-869", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1123", rating: "29 kW / AHU"]
f2cb = breaker [label: "CB-327", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-736", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1058", rating: "kW / kWh"]
f2pnl = hub [label: "FD-982", rating: "3P+N"]
f2l1ld = load [label: "PNL-1410", rating: "CLASSROOM LIGHTING / 57 kW"]
f2l2cb = breaker [label: "CB-380", rating: "MCCB / 80 A / 3P"]
f2l2drv = vfd [label: "DRV-882", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1144", rating: "36 kW / AHU"]
f3cb = breaker [label: "CB-352", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-773", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1051", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1473", rating: "CLASSROOM LIGHTING / 48 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
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
