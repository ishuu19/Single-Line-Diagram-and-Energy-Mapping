sld "GEN-0256 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-469", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1640", rating: "1390 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-355", rating: "MCCB / 2000 A / 3P"]
mctA1 = ct [label: "TA-718", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1098", rating: "kW / kWh"]
busB = bus [label: "BUS-440", voltage: "400Y/230V"]
srcB1 = utility [label: "20kV SUPPLY B", voltage: "20kV"]
txB1 = transformer_dy [label: "TX-1678", rating: "690 kVA", voltage: "20kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-348", rating: "ACB / 1000 A / 3P"]
mctB1 = ct [label: "TA-714", rating: "3 CTs / 1000/5 A"]
mpmB1 = watthour_meter [label: "PM-1063", rating: "kW / kWh"]
tie = bus_tie [label: "CB-394", rating: "2000 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-349", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-756", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1439", rating: "AUXILIARY PANEL / 32 kW"]
f2cb = breaker [label: "CB-347", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-790", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1049", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1495", rating: "PACKAGING PANEL / 28 kW"]

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
busB -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
