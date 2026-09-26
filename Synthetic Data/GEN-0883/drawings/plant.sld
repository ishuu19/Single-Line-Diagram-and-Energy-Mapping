sld "GEN-0883 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-482", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1607", rating: "330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-300", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-719", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
busB = bus [label: "BUS-455", voltage: "480Y/277V"]
srcB1 = utility [label: "13.8kV SUPPLY B", voltage: "13.8kV"]
mcbB1 = breaker [label: "CB-355", rating: "ACB / 250 A / 3P"]
mctB1 = ct [label: "TA-773", rating: "3 CTs / 250/5 A"]
mpmB1 = watthour_meter [label: "PM-1045", rating: "kW / kWh"]
tie = bus_tie [label: "CB-387", rating: "2000 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-368", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-727", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1476", rating: "AUXILIARY PANEL / 34 kW"]
f2cb = breaker [label: "CB-356", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-700", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1473", rating: "AUXILIARY PANEL / 16 kW"]
f3cb = breaker [label: "CB-373", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-755", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1073", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1401", rating: "AUXILIARY PANEL / 16 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> mcbB1
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
busB -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
