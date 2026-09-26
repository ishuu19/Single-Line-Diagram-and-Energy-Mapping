sld "GEN-0535 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-462", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1675", rating: "670 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-357", rating: "MCCB / 800 A / 3P"]
mctA1 = ct [label: "TA-771", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
busB = bus [label: "BUS-457", voltage: "480Y/277V"]
srcB1 = utility [label: "13.8kV SUPPLY B", voltage: "13.8kV"]
txB1 = transformer_dy [label: "TX-1676", rating: "1660 kVA", voltage: "13.8kV / 480Y/277V"]
mcbB1 = breaker [label: "CB-360", rating: "ACB / 2000 A / 3P"]
mctB1 = ct [label: "TA-702", rating: "3 CTs / 2000/5 A"]
mpmB1 = watthour_meter [label: "PM-1067", rating: "kW / kWh"]
tie = bus_tie [label: "CB-304", rating: "630 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-383", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-739", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1098", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1438", rating: "AUXILIARY PANEL / 20 kW"]
f2cb = breaker [label: "CB-330", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-723", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1019", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1445", rating: "AUXILIARY PANEL / 37 kW"]
f3cb = breaker [label: "CB-348", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-758", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1464", rating: "AUXILIARY PANEL / 26 kW"]

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
busB -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
