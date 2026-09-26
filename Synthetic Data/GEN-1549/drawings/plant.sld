sld "GEN-1549 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-432", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1616", rating: "330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-353", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-724", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
busB = bus [label: "BUS-467", voltage: "480Y/277V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "480Y/277V", rating: "1490 kW"]
mcbB1 = breaker [label: "CB-339", rating: "ACB / 2000 A / 3P"]
mctB1 = ct [label: "TA-782", rating: "3 CTs / 2000/5 A"]
mpmB1 = watthour_meter [label: "PM-1058", rating: "kW / kWh"]
tie = ats [label: "CB-371", rating: "800 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-385", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-760", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1018", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1450", rating: "AUXILIARY PANEL / 16 kW"]
f2cb = breaker [label: "CB-334", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-755", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1481", rating: "AUXILIARY PANEL / 52 kW"]
f3cb = breaker [label: "CB-344", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-702", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1449", rating: "PACKAGING PANEL / 15 kW"]

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
busA -> f2cb [cable: "3#4 AWG"]
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
