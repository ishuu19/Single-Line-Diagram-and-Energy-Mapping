sld "GEN-0506 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-477", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
mcbA1 = breaker [label: "CB-381", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-706", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1046", rating: "kW / kWh"]
busB = bus [label: "BUS-421", voltage: "480Y/277V"]
srcB1 = utility [label: "13.8kV SUPPLY B", voltage: "13.8kV"]
txB1 = transformer_dy [label: "TX-1659", rating: "330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbB1 = breaker [label: "CB-376", rating: "ACB / 400 A / 3P"]
mctB1 = ct [label: "TA-794", rating: "3 CTs / 400/5 A"]
mpmB1 = watthour_meter [label: "PM-1000", rating: "kW / kWh"]
tie = bus_tie [label: "CB-353", rating: "2000 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-374", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-735", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1452", rating: "RISER PANEL / 87 kW"]
f2cb = breaker [label: "CB-306", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-701", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1029", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1490", rating: "AUXILIARY PANEL / 16 kW"]
f3cb = breaker [label: "CB-325", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-790", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1058", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1409", rating: "AUXILIARY PANEL / 13 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> txB1
txB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#2/0 AWG"]
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
