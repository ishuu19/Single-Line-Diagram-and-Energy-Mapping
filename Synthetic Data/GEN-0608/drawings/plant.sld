sld "GEN-0608 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-420", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1606", rating: "140 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-330", rating: "MCCB / 400 A / 3P"]
mctA1 = ct [label: "TA-708", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1081", rating: "kW / kWh"]
srcA2 = utility [label: "12.47kV STANDBY", voltage: "12.47kV"]
mcbA2 = breaker [label: "CB-389", rating: "ACB / 250 A / 3P"]
mctA2 = ct [label: "TA-788", rating: "3 CTs / 250/5 A"]
mpmA2 = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
f1cb = breaker [label: "CB-315", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-758", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1432", rating: "AUXILIARY PANEL / 31 kW"]
f2cb = breaker [label: "CB-325", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-733", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1063", rating: "kW / kWh"]
f2pnl = hub [label: "FD-965", rating: "3P+N"]
f2l1ld = load [label: "PNL-1485", rating: "AUXILIARY PANEL / 44 kW"]
f2l2ld = load [label: "PNL-1410", rating: "AUXILIARY PANEL / 31 kW"]
f3cb = breaker [label: "CB-373", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-709", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1034", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1489", rating: "AUXILIARY PANEL / 18 kW"]

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
busA -> f2cb [cable: "3#4 AWG"]
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
