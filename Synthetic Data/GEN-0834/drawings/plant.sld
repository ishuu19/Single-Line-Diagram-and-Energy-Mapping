sld "GEN-0834 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-428", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1636", rating: "1390 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-329", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-729", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1079", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 277 kW", voltage: "400Y/230V"]
mcbA2 = breaker [label: "CB-377", rating: "MCCB / 400 A / 3P"]
mctA2 = ct [label: "TA-797", rating: "3 CTs / 400/5 A"]
mpmA2 = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
f1cb = breaker [label: "CB-333", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-761", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1420", rating: "CLASSROOM LIGHTING / 52 kW"]
f2cb = breaker [label: "CB-390", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-738", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1038", rating: "kW / kWh"]
f2pnl = hub [label: "FD-909", rating: "3P+N"]
f2l1ld = load [label: "PNL-1479", rating: "AUXILIARY PANEL / 28 kW"]
f2l2ld = load [label: "PNL-1452", rating: "AUXILIARY PANEL / 30 kW"]
f3cb = breaker [label: "CB-376", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-751", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1099", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1490", rating: "CLASSROOM LIGHTING / 33 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
