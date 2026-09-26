sld "GEN-1010 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-495", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1608", rating: "550 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-340", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-765", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
busB = bus [label: "BUS-411", voltage: "400Y/230V"]
srcB1 = utility [label: "11kV SUPPLY B", voltage: "11kV"]
txB1 = transformer_dy [label: "TX-1615", rating: "440 kVA", voltage: "11kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-327", rating: "MCCB / 630 A / 3P"]
mctB1 = ct [label: "TA-709", rating: "3 CTs / 630/5 A"]
mpmB1 = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
tie = bus_tie [label: "CB-364", rating: "630 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-368", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-704", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1452", rating: "GROW LIGHTING / 43 kW"]
f2cb = breaker [label: "CB-305", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-700", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1494", rating: "CONTROL PANEL / 25 kW"]
f3cb = breaker [label: "CB-384", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-776", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1476", rating: "AUXILIARY PANEL / 26 kW"]

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
busB -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
