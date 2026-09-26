sld "GEN-0093 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-425", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1644", rating: "1110 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-386", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-757", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1096", rating: "kW / kWh"]
f1cb = breaker [label: "CB-350", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-759", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f1pnl = hub [label: "FD-999", rating: "3P+N"]
f1l1ld = load [label: "PNL-1461", rating: "PRESS FLOOR PANEL / 22 kW"]
f1l2ld = load [label: "PNL-1474", rating: "PRESS FLOOR PANEL / 16 kW"]
f2cb = breaker [label: "CB-302", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-712", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1003", rating: "kW / kWh"]
f2pnl = hub [label: "FD-953", rating: "3P+N"]
f2l1ld = load [label: "PNL-1483", rating: "PRESS FLOOR PANEL / 24 kW"]
f2l2ld = load [label: "PNL-1488", rating: "AUXILIARY PANEL / 30 kW"]
f3cb = breaker [label: "CB-335", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-776", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1041", rating: "kW / kWh"]
f3pnl = hub [label: "FD-986", rating: "3P+N"]
f3l1ld = load [label: "PNL-1430", rating: "AUXILIARY PANEL / 30 kW"]
f3l2ld = load [label: "PNL-1497", rating: "AUXILIARY PANEL / 34 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
