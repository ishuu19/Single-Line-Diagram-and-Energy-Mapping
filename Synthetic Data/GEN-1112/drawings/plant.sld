sld "GEN-1112 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-491", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1614", rating: "670 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-326", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-748", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1073", rating: "kW / kWh"]
f1cb = breaker [label: "CB-369", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-751", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1039", rating: "kW / kWh"]
f1pnl = hub [label: "FD-971", rating: "3P+N"]
f1l1cb = breaker [label: "CB-385", rating: "MCCB / 63 A / 3P"]
f1l1m = motor [label: "MTR-1113", rating: "34 kW / COND"]
f1l2ld = load [label: "PNL-1478", rating: "PACKAGING PANEL / 30 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2ld
mctA1 -> mpmA1
f1ct -> f1pm
