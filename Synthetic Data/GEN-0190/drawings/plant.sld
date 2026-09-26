sld "GEN-0190 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-410", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1681", rating: "1330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-309", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-780", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
f1cb = breaker [label: "CB-397", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-727", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
f1pnl = hub [label: "FD-928", rating: "3P+N"]
f1l1ld = load [label: "PNL-1431", rating: "PRESS FLOOR PANEL / 38 kW"]
f1l2ld = load [label: "PNL-1474", rating: "SHOP LIGHTING / 13 kW"]
f2cb = breaker [label: "CB-322", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-729", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1099", rating: "kW / kWh"]
f2pnl = hub [label: "FD-963", rating: "3P+N"]
f2l1ld = load [label: "PNL-1429", rating: "SHOP LIGHTING / 14 kW"]
f2l2ld = load [label: "PNL-1461", rating: "PRESS FLOOR PANEL / 23 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
