sld "GEN-1069 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-423", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1636", rating: "330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-346", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-783", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
busB = bus [label: "BUS-471", voltage: "480Y/277V"]
srcB1 = utility [label: "13.8kV SUPPLY B", voltage: "13.8kV"]
mcbB1 = breaker [label: "CB-360", rating: "ACB / 630 A / 3P"]
mctB1 = ct [label: "TA-794", rating: "3 CTs / 630/5 A"]
mpmB1 = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
tie = bus_tie [label: "CB-393", rating: "400 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-303", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-784", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1011", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1483", rating: "AUXILIARY PANEL / 20 kW"]
f2cb = breaker [label: "CB-384", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-771", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1425", rating: "GROW LIGHTING / 62 kW"]
f3cb = breaker [label: "CB-357", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-787", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1410", rating: "GROW LIGHTING / 78 kW"]

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
busB -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
