sld "GEN-1094 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-439", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1661", rating: "140 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-376", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-739", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1016", rating: "kW / kWh"]
busB = bus [label: "BUS-473", voltage: "208Y/120V"]
srcB1 = utility [label: "12.47kV SUPPLY B", voltage: "12.47kV"]
txB1 = transformer_yd [label: "TX-1655", rating: "140 kVA", voltage: "12.47kV / 208Y/120V"]
mcbB1 = breaker [label: "CB-305", rating: "ACB / 400 A / 3P"]
mctB1 = ct [label: "TA-703", rating: "3 CTs / 400/5 A"]
mpmB1 = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
tie = bus_tie [label: "CB-314", rating: "2000 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-395", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-782", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1015", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1432", rating: "TENANT PANEL / 74 kW"]
f2cb = breaker [label: "CB-384", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-711", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1456", rating: "AUXILIARY PANEL / 39 kW"]
f3cb = breaker [label: "CB-380", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-787", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1045", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1451", rating: "TENANT PANEL / 103 kW"]

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
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
