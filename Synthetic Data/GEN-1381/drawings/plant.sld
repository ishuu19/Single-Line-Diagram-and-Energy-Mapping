sld "GEN-1381 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-420", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
mcbA1 = breaker [label: "CB-395", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-797", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1019", rating: "kW / kWh"]
busB = bus [label: "BUS-461", voltage: "208Y/120V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "208Y/120V", rating: "320 kW"]
mcbB1 = breaker [label: "CB-310", rating: "MCCB / 1000 A / 3P"]
mctB1 = ct [label: "TA-702", rating: "3 CTs / 1000/5 A"]
mpmB1 = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
tie = ats [label: "CB-392", rating: "630 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-365", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-732", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1038", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1419", rating: "AUXILIARY PANEL / 45 kW"]
f2cb = breaker [label: "CB-348", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-774", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1095", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-379", rating: "MCCB / 50 A / 3P"]
f2l1m = motor [label: "MTR-1194", rating: "11 kW / EF"]
f3cb = breaker [label: "CB-387", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-781", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1412", rating: "AUXILIARY PANEL / 38 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
busB -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
