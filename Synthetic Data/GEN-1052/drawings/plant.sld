sld "GEN-1052 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-423", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1624", rating: "520 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-389", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-735", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
f1cb = breaker [label: "CB-300", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-771", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1414", rating: "CELLAR PANEL / 18 kW"]
f2cb = breaker [label: "CB-330", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-781", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1073", rating: "kW / kWh"]
f2pnl = hub [label: "FD-982", rating: "3P+N"]
f2l1ld = load [label: "PNL-1405", rating: "CELLAR PANEL / 21 kW"]
f2l2ld = load [label: "PNL-1479", rating: "CELLAR PANEL / 20 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
