sld "GEN-1074 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-489", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1621", rating: "280 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-304", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-788", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
busB = bus [label: "BUS-497", voltage: "400Y/230V"]
srcB1 = utility [label: "11kV SUPPLY B", voltage: "11kV"]
txB1 = transformer_yd [label: "TX-1601", rating: "170 kVA", voltage: "11kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-370", rating: "MCCB / 250 A / 3P"]
mctB1 = ct [label: "TA-751", rating: "3 CTs / 250/5 A"]
mpmB1 = watthour_meter [label: "PM-1072", rating: "kW / kWh"]
tie = bus_tie [label: "CB-348", rating: "630 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-312", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-797", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1047", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1459", rating: "RECTIFIER PDU / 24 kW"]
f2cb = breaker [label: "CB-394", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-780", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1469", rating: "SHELTER LIGHTING / 11 kW"]

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
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
