sld "GEN-0683 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-403", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1662", rating: "830 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-353", rating: "MCCB / 1000 A / 3P"]
mctA1 = ct [label: "TA-726", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f1cb = breaker [label: "CB-394", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-766", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1045", rating: "kW / kWh"]
f1pnl = hub [label: "FD-923", rating: "3P+N"]
f1l1ld = load [label: "PNL-1469", rating: "CELLAR PANEL / 16 kW"]
f1l2ld = load [label: "PNL-1499", rating: "CELLAR PANEL / 14 kW"]
f2cb = breaker [label: "CB-373", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-750", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1007", rating: "kW / kWh"]
f2pnl = hub [label: "FD-909", rating: "3P+N"]
f2l1cb = breaker [label: "CB-399", rating: "MCCB / 50 A / 3P"]
f2l1m = motor [label: "MTR-1153", rating: "25 kW / COND"]
f2l2cb = breaker [label: "CB-334", rating: "MCCB / 40 A / 3P"]
f2l2m = motor [label: "MTR-1164", rating: "21 kW / COND"]

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
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1m
f2pnl -> f2l2cb
f2l2cb -> f2l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
