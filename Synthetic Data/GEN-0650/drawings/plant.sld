sld "GEN-0650 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-496", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1682", rating: "1110 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-367", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-716", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1099", rating: "kW / kWh"]
busB = bus [label: "BUS-483", voltage: "400Y/230V"]
srcB1 = utility [label: "20kV SUPPLY B", voltage: "20kV"]
txB1 = transformer_yd [label: "TX-1651", rating: "550 kVA", voltage: "20kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-346", rating: "ACB / 800 A / 3P"]
mctB1 = ct [label: "TA-795", rating: "3 CTs / 800/5 A"]
mpmB1 = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
tie = bus_tie [label: "CB-322", rating: "1000 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-362", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-756", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1474", rating: "PRESS FLOOR PANEL / 22 kW"]
f2cb = breaker [label: "CB-366", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-792", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1418", rating: "PRESS FLOOR PANEL / 35 kW"]
f3cb = breaker [label: "CB-327", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-775", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1437", rating: "SHOP LIGHTING / 21 kW"]

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
busB -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
