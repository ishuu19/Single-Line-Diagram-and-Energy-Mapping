sld "GEN-0082 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-404", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1602", rating: "580 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-333", rating: "MCCB / 1600 A / 3P"]
mctA1 = ct [label: "TA-770", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1050", rating: "kW / kWh"]
busB = bus [label: "BUS-426", voltage: "208Y/120V"]
srcB1 = utility [label: "12.47kV SUPPLY B", voltage: "12.47kV"]
txB1 = transformer_yd [label: "TX-1686", rating: "580 kVA", voltage: "12.47kV / 208Y/120V"]
mcbB1 = breaker [label: "CB-321", rating: "MCCB / 1600 A / 3P"]
mctB1 = ct [label: "TA-709", rating: "3 CTs / 1600/5 A"]
mpmB1 = watthour_meter [label: "PM-1037", rating: "kW / kWh"]
tie = bus_tie [label: "CB-312", rating: "630 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-382", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-752", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1022", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1403", rating: "PACKAGING PANEL / 24 kW"]
f2cb = breaker [label: "CB-351", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-737", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1049", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1450", rating: "AUXILIARY PANEL / 28 kW"]
f3cb = breaker [label: "CB-334", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-790", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1069", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1465", rating: "PACKAGING PANEL / 14 kW"]

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
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
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
