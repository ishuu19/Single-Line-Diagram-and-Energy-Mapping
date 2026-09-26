sld "GEN-0154 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-405", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1665", rating: "720 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-310", rating: "MCCB / 2000 A / 3P"]
mctA1 = ct [label: "TA-706", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
srcA2 = utility [label: "12.47kV STANDBY", voltage: "12.47kV"]
txA2 = transformer_dy [label: "TX-1628", rating: "290 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA2 = breaker [label: "CB-358", rating: "MCCB / 800 A / 3P"]
mctA2 = ct [label: "TA-752", rating: "3 CTs / 800/5 A"]
mpmA2 = watthour_meter [label: "PM-1036", rating: "kW / kWh"]
f1cb = breaker [label: "CB-321", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-759", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1094", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1462", rating: "DOSING PANEL / 37 kW"]
f2cb = breaker [label: "CB-396", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-742", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1013", rating: "kW / kWh"]
f2pnl = hub [label: "FD-981", rating: "3P+N"]
f2l1ld = load [label: "PNL-1495", rating: "AUXILIARY PANEL / 69 kW"]
f2l2ld = load [label: "PNL-1478", rating: "DOSING PANEL / 18 kW"]
f3cb = breaker [label: "CB-311", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-702", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1033", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1411", rating: "AUXILIARY PANEL / 19 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
