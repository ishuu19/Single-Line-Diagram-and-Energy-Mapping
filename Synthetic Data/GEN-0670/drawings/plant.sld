sld "GEN-0670 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-480", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1612", rating: "1390 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-337", rating: "MCCB / 2000 A / 3P"]
mctA1 = ct [label: "TA-735", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1032", rating: "kW / kWh"]
busB = bus [label: "BUS-441", voltage: "400Y/230V"]
srcB1 = utility [label: "33kV SUPPLY B", voltage: "33kV"]
txB1 = transformer_yd [label: "TX-1647", rating: "1390 kVA", voltage: "33kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-351", rating: "MCCB / 2000 A / 3P"]
mctB1 = ct [label: "TA-753", rating: "3 CTs / 2000/5 A"]
mpmB1 = watthour_meter [label: "PM-1098", rating: "kW / kWh"]
tie = bus_tie [label: "CB-348", rating: "400 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-308", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-752", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1087", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1469", rating: "AUXILIARY PANEL / 51 kW"]
f2cb = breaker [label: "CB-393", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-796", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1067", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1439", rating: "PACKAGING PANEL / 13 kW"]
f3cb = breaker [label: "CB-383", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-779", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1004", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1490", rating: "AUXILIARY PANEL / 44 kW"]

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
busB -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
