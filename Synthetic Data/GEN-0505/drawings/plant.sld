sld "GEN-0505 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-486", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1668", rating: "1390 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-334", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-735", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
srcA2 = utility [label: "33kV STANDBY", voltage: "33kV"]
txA2 = transformer_yd [label: "TX-1699", rating: "690 kVA", voltage: "33kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-387", rating: "ACB / 1000 A / 3P"]
mctA2 = ct [label: "TA-709", rating: "3 CTs / 1000/5 A"]
mpmA2 = watthour_meter [label: "PM-1057", rating: "kW / kWh"]
srcA3 = solar [label: "PV ARRAY 379 kW", voltage: "400Y/230V"]
mcbA3 = breaker [label: "CB-333", rating: "MCCB / 630 A / 3P"]
mctA3 = ct [label: "TA-755", rating: "3 CTs / 630/5 A"]
mpmA3 = watthour_meter [label: "PM-1067", rating: "kW / kWh"]
f1cb = breaker [label: "CB-315", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-774", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1433", rating: "DC FAST CHARGER BANK / 89 kW"]
f2cb = breaker [label: "CB-321", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-788", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1049", rating: "kW / kWh"]
f2pnl = hub [label: "FD-905", rating: "3P+N"]
f2l1ld = load [label: "PNL-1447", rating: "CANOPY AUXILIARIES / 20 kW"]
f2l2ld = load [label: "PNL-1461", rating: "CANOPY AUXILIARIES / 15 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
srcA3 -> mcbA3
mcbA3 -> mctA3
mctA3 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
mctA2 -> mpmA2
mctA3 -> mpmA3
f1ct -> f1pm
f2ct -> f2pm
