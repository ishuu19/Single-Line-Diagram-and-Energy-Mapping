sld "GEN-0147 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-455", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1694", rating: "290 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-354", rating: "MCCB / 800 A / 3P"]
mctA1 = ct [label: "TA-769", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1015", rating: "kW / kWh"]
busB = bus [label: "BUS-447", voltage: "208Y/120V"]
srcB1 = utility [label: "12.47kV SUPPLY B", voltage: "12.47kV"]
txB1 = transformer_yd [label: "TX-1687", rating: "290 kVA", voltage: "12.47kV / 208Y/120V"]
mcbB1 = breaker [label: "CB-375", rating: "ACB / 800 A / 3P"]
mctB1 = ct [label: "TA-711", rating: "3 CTs / 800/5 A"]
mpmB1 = watthour_meter [label: "PM-1066", rating: "kW / kWh"]
tie = bus_tie [label: "CB-309", rating: "1000 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-345", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-798", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1096", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1403", rating: "AUXILIARY PANEL / 22 kW"]
f2cb = breaker [label: "CB-357", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-776", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1410", rating: "AUXILIARY PANEL / 39 kW"]
f3cb = breaker [label: "CB-340", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-722", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1091", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1478", rating: "DOSING PANEL / 26 kW"]

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
busB -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
