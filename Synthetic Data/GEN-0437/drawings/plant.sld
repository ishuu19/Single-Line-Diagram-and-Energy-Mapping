sld "GEN-0437 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-495", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1688", rating: "1110 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-378", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-764", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1031", rating: "kW / kWh"]
f1cb = breaker [label: "CB-367", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-719", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1025", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1458", rating: "SHOP LIGHTING / 24 kW"]
f2cb = breaker [label: "CB-318", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-718", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1072", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1472", rating: "PRESS FLOOR PANEL / 35 kW"]
f3cb = breaker [label: "CB-333", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-754", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
f3pnl = hub [label: "FD-989", rating: "3P+N"]
f3l1cb = breaker [label: "CB-385", rating: "MCCB / 80 A / 3P"]
f3l1drv = vfd [label: "DRV-850", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1104", rating: "35 kW / PROC"]
f3l2ld = load [label: "PNL-1470", rating: "SHOP LIGHTING / 21 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
