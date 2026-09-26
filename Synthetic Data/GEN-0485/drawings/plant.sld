sld "GEN-0485 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-487", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1615", rating: "1110 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-381", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-746", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 259 kW", voltage: "400Y/230V"]
mcbA2 = breaker [label: "CB-394", rating: "MCCB / 400 A / 3P"]
mctA2 = ct [label: "TA-784", rating: "3 CTs / 400/5 A"]
mpmA2 = watthour_meter [label: "PM-1034", rating: "kW / kWh"]
f1cb = breaker [label: "CB-346", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-739", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1029", rating: "kW / kWh"]
f1pnl = hub [label: "FD-923", rating: "3P+N"]
f1l1ld = load [label: "PNL-1402", rating: "FORECOURT LIGHTING / 21 kW"]
f1l2ld = load [label: "PNL-1425", rating: "CANOPY AUXILIARIES / 17 kW"]
f2cb = breaker [label: "CB-320", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-771", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1495", rating: "FORECOURT LIGHTING / 20 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
