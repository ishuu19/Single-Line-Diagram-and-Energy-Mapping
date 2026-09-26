sld "GEN-1416 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-476", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1652", rating: "170 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-333", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-782", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1041", rating: "kW / kWh"]
f1cb = breaker [label: "CB-311", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-737", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
f1pnl = hub [label: "FD-965", rating: "3P+N"]
f1l1cb = breaker [label: "CB-321", rating: "MCCB / 16 A / 3P"]
f1l1m = motor [label: "MTR-1122", rating: "5 kW / EF"]
f1l2cb = breaker [label: "CB-351", rating: "MCCB / 160 A / 3P"]
f1l2drv = vfd [label: "DRV-879", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1141", rating: "63 kW / COMP"]
f2cb = breaker [label: "CB-345", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-755", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1056", rating: "kW / kWh"]
f2pnl = hub [label: "FD-976", rating: "3P+N"]
f2l1cb = breaker [label: "CB-382", rating: "MCCB / 125 A / 3P"]
f2l1drv = vfd [label: "DRV-847", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1123", rating: "60 kW / COMP"]
f2l2ld = load [label: "PNL-1480", rating: "DOCK PANEL / 26 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
