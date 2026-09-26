sld "GEN-1042 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-455", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1616", rating: "1390 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-369", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-714", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
f1cb = breaker [label: "CB-307", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-788", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1025", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1489", rating: "RISER PANEL / 91 kW"]
f2cb = breaker [label: "CB-306", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-765", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1094", rating: "kW / kWh"]
f2pnl = hub [label: "FD-951", rating: "3P+N"]
f2l1ld = load [label: "PNL-1451", rating: "AUXILIARY PANEL / 15 kW"]
f2l2ld = load [label: "PNL-1410", rating: "RISER PANEL / 44 kW"]
f3cb = breaker [label: "CB-355", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-792", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1079", rating: "kW / kWh"]
f3pnl = hub [label: "FD-936", rating: "3P+N"]
f3l1ld = load [label: "PNL-1468", rating: "AUXILIARY PANEL / 24 kW"]
f3l2cb = breaker [label: "CB-361", rating: "MCCB / 63 A / 3P"]
f3l2drv = vfd [label: "DRV-839", rating: "VFD / OL"]
f3l2m = motor [label: "MTR-1105", rating: "28 kW / CRAC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2cb
f3l2cb -> f3l2drv
f3l2drv -> f3l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
