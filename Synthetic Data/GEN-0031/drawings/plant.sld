sld "GEN-0031 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-486", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1654", rating: "280 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-304", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-768", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1081", rating: "kW / kWh"]
f1cb = breaker [label: "CB-388", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-762", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f1pnl = hub [label: "FD-965", rating: "3P+N"]
f1l1ld = load [label: "PNL-1482", rating: "AUXILIARY PANEL / 29 kW"]
f1l2ld = load [label: "PNL-1416", rating: "AUXILIARY PANEL / 37 kW"]
f2cb = breaker [label: "CB-390", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-739", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1039", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-365", rating: "MCCB / 40 A / 3P"]
f2l1drv = vfd [label: "DRV-883", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1184", rating: "16 kW / AHU"]
f3cb = breaker [label: "CB-356", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-728", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1017", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-355", rating: "MCCB / 50 A / 3P"]
f3l1drv = vfd [label: "DRV-888", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1101", rating: "24 kW / AHU"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
