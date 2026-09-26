sld "GEN-1547 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-454", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1673", rating: "670 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-385", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-737", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1029", rating: "kW / kWh"]
busB = bus [label: "BUS-460", voltage: "480Y/277V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "480Y/277V", rating: "1490 kW"]
mcbB1 = breaker [label: "CB-307", rating: "MCCB / 2000 A / 3P"]
mctB1 = ct [label: "TA-783", rating: "3 CTs / 2000/5 A"]
mpmB1 = watthour_meter [label: "PM-1097", rating: "kW / kWh"]
tie = ats [label: "CB-308", rating: "1000 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-312", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-711", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1087", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1497", rating: "AUXILIARY PANEL / 34 kW"]
f2cb = breaker [label: "CB-331", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-738", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1017", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1484", rating: "AUXILIARY PANEL / 33 kW"]
f3cb = breaker [label: "CB-314", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-761", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1418", rating: "AUXILIARY PANEL / 29 kW"]

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
busB -> f2cb [cable: "3#1/0 AWG"]
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
