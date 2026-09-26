sld "GEN-1302 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-444", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
mcbA1 = breaker [label: "CB-353", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-778", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1069", rating: "kW / kWh"]
busB = bus [label: "BUS-439", voltage: "208Y/120V"]
srcB1 = utility [label: "12.47kV SUPPLY B", voltage: "12.47kV"]
txB1 = transformer_dy [label: "TX-1608", rating: "90 kVA", voltage: "12.47kV / 208Y/120V"]
mcbB1 = breaker [label: "CB-305", rating: "MCCB / 250 A / 3P"]
mctB1 = ct [label: "TA-752", rating: "3 CTs / 250/5 A"]
mpmB1 = watthour_meter [label: "PM-1004", rating: "kW / kWh"]
tie = bus_tie [label: "CB-389", rating: "400 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-342", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-794", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1036", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1455", rating: "AUXILIARY PANEL / 27 kW"]
f2cb = breaker [label: "CB-384", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-769", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1047", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1494", rating: "AUXILIARY PANEL / 33 kW"]
f3cb = breaker [label: "CB-393", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-723", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1022", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1485", rating: "SHOP LIGHTING / 24 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> txB1
txB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
