sld "GEN-0547 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-416", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1621", rating: "280 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-355", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-722", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 570 kW", voltage: "400Y/230V"]
mcbA2 = breaker [label: "CB-324", rating: "MCCB / 160 A / 3P"]
mctA2 = ct [label: "TA-723", rating: "3 CTs / 160/5 A"]
mpmA2 = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
f1cb = breaker [label: "CB-319", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-784", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1094", rating: "kW / kWh"]
f1pnl = hub [label: "FD-965", rating: "3P+N"]
f1l1cb = breaker [label: "CB-307", rating: "MCCB / 63 A / 3P"]
f1l1drv = vfd [label: "DRV-841", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1122", rating: "29 kW / AHU"]
f1l2ld = load [label: "PNL-1468", rating: "SITE LIGHTING / 23 kW"]
f2cb = breaker [label: "CB-343", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-782", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1029", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-371", rating: "MCCB / 80 A / 3P"]
f2l1drv = vfd [label: "DRV-805", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1192", rating: "35 kW / AHU"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
