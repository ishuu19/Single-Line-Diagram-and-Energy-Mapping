sld "GEN-0219 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-458", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
mcbA1 = breaker [label: "CB-391", rating: "MCCB / 2000 A / 3P"]
mctA1 = ct [label: "TA-759", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 306 kW", voltage: "208Y/120V"]
mcbA2 = breaker [label: "CB-311", rating: "MCCB / 250 A / 3P"]
mctA2 = ct [label: "TA-708", rating: "3 CTs / 250/5 A"]
mpmA2 = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
f1cb = breaker [label: "CB-348", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-763", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1015", rating: "kW / kWh"]
f1pnl = hub [label: "FD-973", rating: "3P+N"]
f1l1ld = load [label: "PNL-1495", rating: "DC FAST CHARGER BANK / 103 kW"]
f1l2ld = load [label: "PNL-1435", rating: "CANOPY AUXILIARIES / 23 kW"]
f2cb = breaker [label: "CB-355", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-769", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1049", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1467", rating: "DC FAST CHARGER BANK / 177 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
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
