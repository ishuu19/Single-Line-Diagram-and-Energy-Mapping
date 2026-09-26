sld "GEN-1038 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-406", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1673", rating: "550 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-332", rating: "MCCB / 800 A / 3P"]
mctA1 = ct [label: "TA-711", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1034", rating: "kW / kWh"]
busB = bus [label: "BUS-417", voltage: "400Y/230V"]
srcB1 = utility [label: "6.6kV SUPPLY B", voltage: "6.6kV"]
txB1 = transformer_yd [label: "TX-1647", rating: "1390 kVA", voltage: "6.6kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-384", rating: "MCCB / 2000 A / 3P"]
mctB1 = ct [label: "TA-726", rating: "3 CTs / 2000/5 A"]
mpmB1 = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
tie = bus_tie [label: "CB-354", rating: "1000 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-394", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-790", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1404", rating: "PRESS FLOOR PANEL / 16 kW"]
f2cb = breaker [label: "CB-333", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-781", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1469", rating: "SHOP LIGHTING / 10 kW"]

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
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
