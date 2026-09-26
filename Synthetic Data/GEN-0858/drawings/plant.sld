sld "GEN-0858 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-438", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
mcbA1 = breaker [label: "CB-376", rating: "MCCB / 2000 A / 3P"]
mctA1 = ct [label: "TA-726", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
f1cb = breaker [label: "CB-389", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-731", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1037", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-345", rating: "MCCB / 63 A / 3P"]
f1l1m = motor [label: "MTR-1191", rating: "36 kW / COMP"]
f2cb = breaker [label: "CB-363", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-717", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
f2pnl = hub [label: "FD-958", rating: "3P+N"]
f2l1ld = load [label: "PNL-1450", rating: "PACKAGING PANEL / 25 kW"]
f2l2ld = load [label: "PNL-1437", rating: "PACKAGING PANEL / 25 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
