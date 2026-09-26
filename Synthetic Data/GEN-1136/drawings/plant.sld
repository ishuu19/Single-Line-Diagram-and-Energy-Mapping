sld "GEN-1136 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-450", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1616", rating: "690 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-318", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-786", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1049", rating: "kW / kWh"]
busB = bus [label: "BUS-420", voltage: "400Y/230V"]
srcB1 = utility [label: "33kV SUPPLY B", voltage: "33kV"]
txB1 = transformer_dy [label: "TX-1610", rating: "1390 kVA", voltage: "33kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-322", rating: "ACB / 2000 A / 3P"]
mctB1 = ct [label: "TA-753", rating: "3 CTs / 2000/5 A"]
mpmB1 = watthour_meter [label: "PM-1068", rating: "kW / kWh"]
tie = bus_tie [label: "CB-371", rating: "800 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-345", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-733", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1066", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1450", rating: "AUXILIARY PANEL / 35 kW"]
f2cb = breaker [label: "CB-312", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-788", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1451", rating: "PRESS FLOOR PANEL / 39 kW"]
f3cb = breaker [label: "CB-331", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-719", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1099", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1487", rating: "SHOP LIGHTING / 10 kW"]

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
busB -> f2cb [cable: "3#4 AWG"]
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
