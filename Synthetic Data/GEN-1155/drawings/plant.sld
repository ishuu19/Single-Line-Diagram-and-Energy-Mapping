sld "GEN-1155 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-477", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1647", rating: "550 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-378", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-766", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1054", rating: "kW / kWh"]
busB = bus [label: "BUS-469", voltage: "400Y/230V"]
srcB1 = utility [label: "11kV SUPPLY B", voltage: "11kV"]
txB1 = transformer_dy [label: "TX-1602", rating: "440 kVA", voltage: "11kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-315", rating: "ACB / 630 A / 3P"]
mctB1 = ct [label: "TA-709", rating: "3 CTs / 630/5 A"]
mpmB1 = watthour_meter [label: "PM-1036", rating: "kW / kWh"]
tie = bus_tie [label: "CB-399", rating: "1000 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-395", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-739", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1417", rating: "AUXILIARY PANEL / 26 kW"]
f2cb = breaker [label: "CB-362", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-710", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1457", rating: "SHOP LIGHTING / 17 kW"]
f3cb = breaker [label: "CB-328", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-757", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1057", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1460", rating: "AUXILIARY PANEL / 28 kW"]

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
busB -> f2cb [cable: "3#4 AWG"]
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
