sld "GEN-1323 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-423", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1656", rating: "1110 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-378", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-722", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1044", rating: "kW / kWh"]
f1cb = breaker [label: "CB-340", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-770", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1045", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1462", rating: "SHOP LIGHTING / 12 kW"]
f2cb = breaker [label: "CB-320", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-763", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1021", rating: "kW / kWh"]
f2pnl = hub [label: "FD-935", rating: "3P+N"]
f2l1ld = load [label: "PNL-1461", rating: "PRESS FLOOR PANEL / 35 kW"]
f2l2ld = load [label: "PNL-1441", rating: "PRESS FLOOR PANEL / 36 kW"]
f3cb = breaker [label: "CB-306", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-723", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1037", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1467", rating: "SHOP LIGHTING / 17 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
