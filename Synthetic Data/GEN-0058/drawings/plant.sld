sld "GEN-0058 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-436", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1694", rating: "140 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-326", rating: "MCCB / 400 A / 3P"]
mctA1 = ct [label: "TA-710", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1087", rating: "kW / kWh"]
busB = bus [label: "BUS-495", voltage: "208Y/120V"]
srcB1 = utility [label: "12.47kV SUPPLY B", voltage: "12.47kV"]
txB1 = transformer_yd [label: "TX-1635", rating: "580 kVA", voltage: "12.47kV / 208Y/120V"]
mcbB1 = breaker [label: "CB-307", rating: "ACB / 1600 A / 3P"]
mctB1 = ct [label: "TA-764", rating: "3 CTs / 1600/5 A"]
mpmB1 = watthour_meter [label: "PM-1058", rating: "kW / kWh"]
tie = bus_tie [label: "CB-311", rating: "630 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-304", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-713", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1032", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1469", rating: "AUXILIARY PANEL / 34 kW"]
f2cb = breaker [label: "CB-318", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-776", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1013", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1447", rating: "AUXILIARY PANEL / 25 kW"]
f3cb = breaker [label: "CB-357", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-758", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1097", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1494", rating: "AUXILIARY PANEL / 18 kW"]

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
busB -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
