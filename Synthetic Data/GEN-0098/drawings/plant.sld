sld "GEN-0098 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-428", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1654", rating: "110 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-357", rating: "ACB / 160 A / 3P"]
mctA1 = ct [label: "TA-761", rating: "3 CTs / 160/5 A"]
mpmA1 = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
busB = bus [label: "BUS-408", voltage: "400Y/230V"]
srcB1 = utility [label: "20kV SUPPLY B", voltage: "20kV"]
txB1 = transformer_yd [label: "TX-1618", rating: "440 kVA", voltage: "20kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-300", rating: "MCCB / 630 A / 3P"]
mctB1 = ct [label: "TA-723", rating: "3 CTs / 630/5 A"]
mpmB1 = watthour_meter [label: "PM-1077", rating: "kW / kWh"]
tie = bus_tie [label: "CB-314", rating: "400 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-380", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-797", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1025", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1400", rating: "AUXILIARY PANEL / 11 kW"]
f2cb = breaker [label: "CB-316", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-777", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1088", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1430", rating: "AUXILIARY PANEL / 12 kW"]
f3cb = breaker [label: "CB-341", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-705", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1466", rating: "AUXILIARY PANEL / 19 kW"]

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
busB -> f2cb [cable: "3#4/0 AWG"]
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
