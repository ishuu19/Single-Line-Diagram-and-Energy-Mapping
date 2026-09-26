sld "GEN-0740 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-422", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1680", rating: "1390 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-331", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-740", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
busB = bus [label: "BUS-490", voltage: "400Y/230V"]
srcB1 = utility [label: "11kV SUPPLY B", voltage: "11kV"]
txB1 = transformer_yd [label: "TX-1694", rating: "170 kVA", voltage: "11kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-311", rating: "ACB / 250 A / 3P"]
mctB1 = ct [label: "TA-753", rating: "3 CTs / 250/5 A"]
mpmB1 = watthour_meter [label: "PM-1026", rating: "kW / kWh"]
tie = bus_tie [label: "CB-363", rating: "630 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-308", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-787", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1063", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1443", rating: "CONTROL PANEL / 22 kW"]
f2cb = breaker [label: "CB-396", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-769", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1469", rating: "AUXILIARY PANEL / 12 kW"]
f3cb = breaker [label: "CB-361", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-776", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1049", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1422", rating: "AUXILIARY PANEL / 22 kW"]

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
busA -> f1cb [cable: "3#1/0 AWG"]
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
