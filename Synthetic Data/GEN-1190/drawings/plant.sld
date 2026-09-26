sld "GEN-1190 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-449", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1673", rating: "330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-311", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-745", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
f1cb = breaker [label: "CB-372", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-755", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1077", rating: "kW / kWh"]
f1pnl = hub [label: "FD-999", rating: "3P+N"]
f1l1ld = load [label: "PNL-1479", rating: "AUXILIARY PANEL / 83 kW"]
f1l2ld = load [label: "PNL-1427", rating: "AUXILIARY PANEL / 30 kW"]
f2cb = breaker [label: "CB-330", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-788", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1045", rating: "kW / kWh"]
f2pnl = hub [label: "FD-985", rating: "3P+N"]
f2l1ld = load [label: "PNL-1444", rating: "DOCK PANEL / 28 kW"]
f2l2ld = load [label: "PNL-1478", rating: "AUXILIARY PANEL / 39 kW"]
f3cb = breaker [label: "CB-331", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-793", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f3pnl = hub [label: "FD-988", rating: "3P+N"]
f3l1cb = breaker [label: "CB-314", rating: "MCCB / 32 A / 3P"]
f3l1m = motor [label: "MTR-1166", rating: "16 kW / COND"]
f3l2ld = load [label: "PNL-1423", rating: "DOCK PANEL / 21 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
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
