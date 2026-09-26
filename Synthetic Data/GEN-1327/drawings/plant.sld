sld "GEN-1327 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-453", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1681", rating: "440 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-391", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-741", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
busB = bus [label: "BUS-498", voltage: "400Y/230V"]
srcB1 = utility [label: "20kV SUPPLY B", voltage: "20kV"]
txB1 = transformer_yd [label: "TX-1646", rating: "280 kVA", voltage: "20kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-382", rating: "ACB / 400 A / 3P"]
mctB1 = ct [label: "TA-727", rating: "3 CTs / 400/5 A"]
mpmB1 = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
tie = bus_tie [label: "CB-355", rating: "1600 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-398", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-773", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1013", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1431", rating: "PRESS FLOOR PANEL / 22 kW"]
f2cb = breaker [label: "CB-304", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-787", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1497", rating: "SHOP LIGHTING / 15 kW"]
f3cb = breaker [label: "CB-345", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-795", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1448", rating: "SHOP LIGHTING / 23 kW"]

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
busA -> f2cb [cable: "3#1/0 AWG"]
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
