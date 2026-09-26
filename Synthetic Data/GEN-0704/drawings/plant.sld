sld "GEN-0704 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-476", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1667", rating: "1660 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-334", rating: "MCCB / 2000 A / 3P"]
mctA1 = ct [label: "TA-783", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1004", rating: "kW / kWh"]
busB = bus [label: "BUS-422", voltage: "480Y/277V"]
srcB1 = utility [label: "13.8kV SUPPLY B", voltage: "13.8kV"]
txB1 = transformer_yd [label: "TX-1692", rating: "670 kVA", voltage: "13.8kV / 480Y/277V"]
mcbB1 = breaker [label: "CB-343", rating: "ACB / 800 A / 3P"]
mctB1 = ct [label: "TA-768", rating: "3 CTs / 800/5 A"]
mpmB1 = watthour_meter [label: "PM-1029", rating: "kW / kWh"]
tie = bus_tie [label: "CB-311", rating: "1600 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-344", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-795", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1032", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1421", rating: "AUXILIARY PANEL / 9 kW"]
f2cb = breaker [label: "CB-305", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-735", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1447", rating: "AUXILIARY PANEL / 27 kW"]
f3cb = breaker [label: "CB-378", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-737", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1054", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1499", rating: "GROW LIGHTING / 35 kW"]

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
