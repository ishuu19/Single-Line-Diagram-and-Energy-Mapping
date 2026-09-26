sld "GEN-0380 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-466", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1639", rating: "830 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-398", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-780", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1036", rating: "kW / kWh"]
f1cb = breaker [label: "CB-346", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-718", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1025", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-375", rating: "MCCB / 63 A / 3P"]
f1l1m = motor [label: "MTR-1186", rating: "37 kW / COMP"]
f2cb = breaker [label: "CB-314", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-748", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1026", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-353", rating: "MCCB / 50 A / 3P"]
f2l1m = motor [label: "MTR-1119", rating: "25 kW / COMP"]
f3cb = breaker [label: "CB-300", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-736", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
f3pnl = hub [label: "FD-994", rating: "3P+N"]
f3l1cb = breaker [label: "CB-348", rating: "MCCB / 20 A / 3P"]
f3l1m = motor [label: "MTR-1124", rating: "11 kW / EF"]
f3l2ld = load [label: "PNL-1445", rating: "UTILITY PANEL / 22 kW"]

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
f2ct -> f2l1cb
f2l1cb -> f2l1m
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
