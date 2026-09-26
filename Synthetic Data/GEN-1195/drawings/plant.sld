sld "GEN-1195 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-485", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1697", rating: "670 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-377", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-722", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
f1cb = breaker [label: "CB-312", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-778", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1499", rating: "PACKAGING PANEL / 23 kW"]
f2cb = breaker [label: "CB-318", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-709", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1016", rating: "kW / kWh"]
f2pnl = hub [label: "FD-955", rating: "3P+N"]
f2l1cb = breaker [label: "CB-385", rating: "MCCB / 50 A / 3P"]
f2l1m = motor [label: "MTR-1166", rating: "27 kW / COND"]
f2l2ld = load [label: "PNL-1424", rating: "PACKAGING PANEL / 22 kW"]
f3cb = breaker [label: "CB-362", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-719", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-375", rating: "MCCB / 50 A / 3P"]
f3l1m = motor [label: "MTR-1168", rating: "25 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1m
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
