sld "GEN-1389 — RETAIL FACILITY / ELECTRICAL DISTRIBUTION"
# STORE SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-430", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1693", rating: "830 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-384", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-727", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1026", rating: "kW / kWh"]
f1cb = breaker [label: "CB-311", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-717", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
f1pnl = hub [label: "FD-966", rating: "3P+N"]
f1l1ld = load [label: "PNL-1445", rating: "SALES FLOOR LIGHTING / 46 kW"]
f1l2cb = breaker [label: "CB-386", rating: "MCCB / 16 A / 3P"]
f1l2m = motor [label: "MTR-1162", rating: "8 kW / EF"]
f2cb = breaker [label: "CB-302", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-720", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1095", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-321", rating: "MCCB / 25 A / 3P"]
f2l1m = motor [label: "MTR-1189", rating: "14 kW / EF"]
f3cb = breaker [label: "CB-300", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-784", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1462", rating: "HOUSE PANEL / 54 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
