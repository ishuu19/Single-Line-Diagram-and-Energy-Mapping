sld "GEN-0720 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-478", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1698", rating: "440 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-320", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-779", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1016", rating: "kW / kWh"]
f1cb = breaker [label: "CB-390", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-731", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1015", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1402", rating: "PRESS FLOOR PANEL / 26 kW"]
f2cb = breaker [label: "CB-345", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-781", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
f2pnl = hub [label: "FD-932", rating: "3P+N"]
f2l1ld = load [label: "PNL-1416", rating: "SHOP LIGHTING / 24 kW"]
f2l2cb = breaker [label: "CB-327", rating: "MCCB / 80 A / 3P"]
f2l2drv = vfd [label: "DRV-879", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1171", rating: "36 kW / PROC"]
f3cb = breaker [label: "CB-334", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-706", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-332", rating: "MCCB / 50 A / 3P"]
f3l1drv = vfd [label: "DRV-889", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1166", rating: "23 kW / PROC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
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
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
