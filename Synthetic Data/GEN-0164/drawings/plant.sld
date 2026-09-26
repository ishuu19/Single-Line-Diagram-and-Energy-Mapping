sld "GEN-0164 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-451", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
mcbA1 = breaker [label: "CB-323", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-782", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1072", rating: "kW / kWh"]
srcA2 = utility [label: "33kV STANDBY", voltage: "33kV"]
txA2 = transformer_yd [label: "TX-1682", rating: "690 kVA", voltage: "33kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-334", rating: "ACB / 1000 A / 3P"]
mctA2 = ct [label: "TA-735", rating: "3 CTs / 1000/5 A"]
mpmA2 = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
f1cb = breaker [label: "CB-361", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-755", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1004", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1461", rating: "AUXILIARY PANEL / 29 kW"]
f2cb = breaker [label: "CB-335", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-763", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1032", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1405", rating: "SHOP LIGHTING / 18 kW"]
f3cb = breaker [label: "CB-364", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-796", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1079", rating: "kW / kWh"]
f3pnl = hub [label: "FD-983", rating: "3P+N"]
f3l1ld = load [label: "PNL-1464", rating: "SHOP LIGHTING / 16 kW"]
f3l2ld = load [label: "PNL-1404", rating: "AUXILIARY PANEL / 27 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
