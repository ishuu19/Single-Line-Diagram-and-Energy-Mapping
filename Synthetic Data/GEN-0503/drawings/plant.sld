sld "GEN-0503 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-445", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1697", rating: "1730 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-315", rating: "ACB / 2500 A / 3P"]
mctA1 = ct [label: "TA-706", rating: "3 CTs / 2500/5 A"]
mpmA1 = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
busB = bus [label: "BUS-479", voltage: "400Y/230V"]
srcB1 = utility [label: "11kV SUPPLY B", voltage: "11kV"]
txB1 = transformer_yd [label: "TX-1695", rating: "690 kVA", voltage: "11kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-391", rating: "ACB / 1000 A / 3P"]
mctB1 = ct [label: "TA-715", rating: "3 CTs / 1000/5 A"]
mpmB1 = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
tie = bus_tie [label: "CB-394", rating: "630 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-318", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-777", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1098", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1441", rating: "AUXILIARY PANEL / 113 kW"]
f2cb = breaker [label: "CB-333", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-702", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1063", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1470", rating: "AUXILIARY PANEL / 193 kW"]
f3cb = breaker [label: "CB-322", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-795", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1053", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1494", rating: "MCC AUXILIARY BOARD / 42 kW"]

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
busA -> f2cb [cable: "3#2/0 AWG"]
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
