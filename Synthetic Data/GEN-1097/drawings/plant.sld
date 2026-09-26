sld "GEN-1097 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-494", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1685", rating: "1390 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-308", rating: "MCCB / 2000 A / 3P"]
mctA1 = ct [label: "TA-720", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
busB = bus [label: "BUS-431", voltage: "400Y/230V"]
srcB1 = utility [label: "6.6kV SUPPLY B", voltage: "6.6kV"]
txB1 = transformer_dy [label: "TX-1679", rating: "690 kVA", voltage: "6.6kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-390", rating: "ACB / 1000 A / 3P"]
mctB1 = ct [label: "TA-742", rating: "3 CTs / 1000/5 A"]
mpmB1 = watthour_meter [label: "PM-1088", rating: "kW / kWh"]
tie = bus_tie [label: "CB-335", rating: "1000 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-365", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-709", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1024", rating: "kW / kWh"]
f1pnl = hub [label: "FD-960", rating: "3P+N"]
f1l1ld = load [label: "PNL-1437", rating: "ADMIN PANEL / 62 kW"]
f1l2ld = load [label: "PNL-1442", rating: "AUXILIARY PANEL / 10 kW"]
f2cb = breaker [label: "CB-300", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-719", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1087", rating: "kW / kWh"]
f2pnl = hub [label: "FD-965", rating: "3P+N"]
f2l1ld = load [label: "PNL-1452", rating: "CLASSROOM LIGHTING / 58 kW"]
f2l2ld = load [label: "PNL-1482", rating: "ADMIN PANEL / 37 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> txB1
txB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busB -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
