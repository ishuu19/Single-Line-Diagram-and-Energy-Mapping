sld "GEN-0335 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-477", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1606", rating: "1390 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-375", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-718", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1046", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 557 kW", voltage: "400Y/230V"]
mcbA2 = breaker [label: "CB-344", rating: "MCCB / 800 A / 3P"]
mctA2 = ct [label: "TA-750", rating: "3 CTs / 800/5 A"]
mpmA2 = watthour_meter [label: "PM-1076", rating: "kW / kWh"]
f1cb = breaker [label: "CB-347", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-749", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1024", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1475", rating: "FORECOURT LIGHTING / 23 kW"]
f2cb = breaker [label: "CB-381", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-706", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1097", rating: "kW / kWh"]
f2pnl = hub [label: "FD-988", rating: "3P+N"]
f2l1ld = load [label: "PNL-1436", rating: "CANOPY AUXILIARIES / 19 kW"]
f2l2ld = load [label: "PNL-1456", rating: "FORECOURT LIGHTING / 19 kW"]
f3cb = breaker [label: "CB-389", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-739", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1014", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1467", rating: "FORECOURT LIGHTING / 13 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
