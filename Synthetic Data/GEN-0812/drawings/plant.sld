sld "GEN-0812 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-443", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1649", rating: "1390 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-346", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-783", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
busB = bus [label: "BUS-410", voltage: "400Y/230V"]
srcB1 = utility [label: "11kV SUPPLY B", voltage: "11kV"]
txB1 = transformer_yd [label: "TX-1641", rating: "440 kVA", voltage: "11kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-374", rating: "MCCB / 630 A / 3P"]
mctB1 = ct [label: "TA-725", rating: "3 CTs / 630/5 A"]
mpmB1 = watthour_meter [label: "PM-1078", rating: "kW / kWh"]
tie = bus_tie [label: "CB-329", rating: "2000 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-359", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-726", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1476", rating: "AUXILIARY PANEL / 26 kW"]
f2cb = breaker [label: "CB-363", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-774", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1042", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1446", rating: "AUXILIARY PANEL / 75 kW"]
f3cb = breaker [label: "CB-366", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-752", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1066", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1466", rating: "DOCK PANEL / 16 kW"]

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
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
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
