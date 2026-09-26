sld "GEN-1431 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-405", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1681", rating: "690 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-340", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-717", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1066", rating: "kW / kWh"]
busB = bus [label: "BUS-477", voltage: "400Y/230V"]
srcB1 = utility [label: "33kV SUPPLY B", voltage: "33kV"]
txB1 = transformer_dy [label: "TX-1668", rating: "170 kVA", voltage: "33kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-339", rating: "ACB / 250 A / 3P"]
mctB1 = ct [label: "TA-768", rating: "3 CTs / 250/5 A"]
mpmB1 = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
tie = bus_tie [label: "CB-306", rating: "1600 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-383", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-713", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1030", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1411", rating: "PRESS FLOOR PANEL / 25 kW"]
f2cb = breaker [label: "CB-367", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-796", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1039", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1461", rating: "AUXILIARY PANEL / 26 kW"]
f3cb = breaker [label: "CB-362", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-795", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1063", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1464", rating: "AUXILIARY PANEL / 35 kW"]

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
