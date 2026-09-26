sld "GEN-0472 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-410", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1649", rating: "330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-382", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-715", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 461 kW", voltage: "480Y/277V"]
mcbA2 = breaker [label: "CB-344", rating: "MCCB / 250 A / 3P"]
mctA2 = ct [label: "TA-701", rating: "3 CTs / 250/5 A"]
mpmA2 = watthour_meter [label: "PM-1049", rating: "kW / kWh"]
f1cb = breaker [label: "CB-321", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-789", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1019", rating: "kW / kWh"]
f1pnl = hub [label: "FD-910", rating: "3P+N"]
f1l1ld = load [label: "PNL-1460", rating: "COMMON AREA LIGHTING / 39 kW"]
f1l2cb = breaker [label: "CB-336", rating: "MCCB / 32 A / 3P"]
f1l2drv = vfd [label: "DRV-831", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1146", rating: "19 kW / CRAC"]

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
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
