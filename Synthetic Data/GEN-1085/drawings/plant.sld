sld "GEN-1085 — RETAIL FACILITY / ELECTRICAL DISTRIBUTION"
# STORE SERVICES SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-441", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1647", rating: "360 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-352", rating: "MCCB / 1000 A / 3P"]
mctA1 = ct [label: "TA-745", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1091", rating: "kW / kWh"]
f1cb = breaker [label: "CB-371", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-773", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-335", rating: "MCCB / 32 A / 3P"]
f1l1m = motor [label: "MTR-1123", rating: "8 kW / EF"]
f2cb = breaker [label: "CB-390", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-738", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1405", rating: "SALES FLOOR LIGHTING / 35 kW"]
f3cb = breaker [label: "CB-307", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-723", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
f3pnl = hub [label: "FD-919", rating: "3P+N"]
f3l1cb = breaker [label: "CB-321", rating: "MCCB / 32 A / 3P"]
f3l1m = motor [label: "MTR-1121", rating: "8 kW / EF"]
f3l2ld = load [label: "PNL-1459", rating: "SALES FLOOR LIGHTING / 55 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1cb
f3l1cb -> f3l1m
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
