sld "GEN-0559 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-437", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1638", rating: "440 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-355", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-758", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1050", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 500 kW", voltage: "400Y/230V"]
mcbA2 = breaker [label: "CB-321", rating: "MCCB / 800 A / 3P"]
mctA2 = ct [label: "TA-745", rating: "3 CTs / 800/5 A"]
mpmA2 = watthour_meter [label: "PM-1098", rating: "kW / kWh"]
f1cb = breaker [label: "CB-373", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-770", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1044", rating: "kW / kWh"]
f1pnl = hub [label: "FD-940", rating: "3P+N"]
f1l1ld = load [label: "PNL-1483", rating: "DC FAST CHARGER BANK / 135 kW"]
f1l2ld = load [label: "PNL-1436", rating: "CANOPY AUXILIARIES / 26 kW"]

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
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
