sld "GEN-0929 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-482", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1626", rating: "2080 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-385", rating: "MCCB / 3000 A / 3P"]
mctA1 = ct [label: "TA-712", rating: "3 CTs / 3000/5 A"]
mpmA1 = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
busB = bus [label: "BUS-418", voltage: "400Y/230V"]
srcB1 = utility [label: "11kV SUPPLY B", voltage: "11kV"]
mcbB1 = breaker [label: "CB-378", rating: "ACB / 1600 A / 3P"]
mctB1 = ct [label: "TA-733", rating: "3 CTs / 1600/5 A"]
mpmB1 = watthour_meter [label: "PM-1090", rating: "kW / kWh"]
tie = bus_tie [label: "CB-384", rating: "800 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-328", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-795", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1044", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1450", rating: "MCC AUXILIARY BOARD / 62 kW"]
f2cb = breaker [label: "CB-353", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-775", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1416", rating: "AUXILIARY PANEL / 304 kW"]
f3cb = breaker [label: "CB-302", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-739", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1077", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1483", rating: "AUXILIARY PANEL / 334 kW"]

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
busB -> f2cb [cable: "3#4/0 AWG"]
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
