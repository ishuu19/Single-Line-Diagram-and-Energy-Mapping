sld "GEN-1040 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-431", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1610", rating: "520 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-304", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-732", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1021", rating: "kW / kWh"]
f1cb = breaker [label: "CB-390", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-753", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
f1pnl = hub [label: "FD-996", rating: "3P+N"]
f1l1ld = load [label: "PNL-1454", rating: "SHORE POWER PANEL / 39 kW"]
f1l2ld = load [label: "PNL-1445", rating: "DOCK LIGHTING / 15 kW"]
f2cb = breaker [label: "CB-321", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-778", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1098", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1409", rating: "DOCK LIGHTING / 24 kW"]
f3cb = breaker [label: "CB-351", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-735", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
f3pnl = hub [label: "FD-915", rating: "3P+N"]
f3l1ld = load [label: "PNL-1476", rating: "DOCK LIGHTING / 11 kW"]
f3l2ld = load [label: "PNL-1415", rating: "DOCK LIGHTING / 23 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
