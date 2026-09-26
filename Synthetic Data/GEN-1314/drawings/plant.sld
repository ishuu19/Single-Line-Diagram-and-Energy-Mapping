sld "GEN-1314 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-448", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1611", rating: "550 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-385", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-754", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1032", rating: "kW / kWh"]
busB = bus [label: "BUS-474", voltage: "400Y/230V"]
srcB1 = utility [label: "20kV SUPPLY B", voltage: "20kV"]
txB1 = transformer_dy [label: "TX-1644", rating: "690 kVA", voltage: "20kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-353", rating: "ACB / 1000 A / 3P"]
mctB1 = ct [label: "TA-798", rating: "3 CTs / 1000/5 A"]
mpmB1 = watthour_meter [label: "PM-1039", rating: "kW / kWh"]
tie = bus_tie [label: "CB-344", rating: "1600 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-328", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-728", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1044", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1412", rating: "AUXILIARY PANEL / 15 kW"]
f2cb = breaker [label: "CB-321", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-783", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1046", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1449", rating: "CELLAR PANEL / 14 kW"]
f3cb = breaker [label: "CB-392", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-763", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1021", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1467", rating: "AUXILIARY PANEL / 15 kW"]

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
