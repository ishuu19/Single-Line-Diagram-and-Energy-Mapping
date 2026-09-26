sld "GEN-1138 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-417", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1661", rating: "690 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-335", rating: "MCCB / 1000 A / 3P"]
mctA1 = ct [label: "TA-723", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1011", rating: "kW / kWh"]
busB = bus [label: "BUS-408", voltage: "400Y/230V"]
srcB1 = utility [label: "22kV SUPPLY B", voltage: "22kV"]
mcbB1 = breaker [label: "CB-371", rating: "ACB / 2000 A / 3P"]
mctB1 = ct [label: "TA-733", rating: "3 CTs / 2000/5 A"]
mpmB1 = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
tie = bus_tie [label: "CB-319", rating: "1000 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-339", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-783", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1033", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1493", rating: "AUXILIARY PANEL / 34 kW"]
f2cb = breaker [label: "CB-381", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-732", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1416", rating: "AUXILIARY PANEL / 44 kW"]
f2x = capacitor_bank [label: "CAP-611", rating: "60 kVAR"]
f3cb = breaker [label: "CB-365", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-751", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1004", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1421", rating: "PACKAGING PANEL / 12 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
f2ct -> f2x
busB -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
