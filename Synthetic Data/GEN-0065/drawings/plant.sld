sld "GEN-0065 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-461", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1628", rating: "280 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-351", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-768", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1007", rating: "kW / kWh"]
busB = bus [label: "BUS-442", voltage: "400Y/230V"]
srcB1 = utility [label: "20kV SUPPLY B", voltage: "20kV"]
txB1 = transformer_yd [label: "TX-1694", rating: "1390 kVA", voltage: "20kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-373", rating: "ACB / 2000 A / 3P"]
mctB1 = ct [label: "TA-770", rating: "3 CTs / 2000/5 A"]
mpmB1 = watthour_meter [label: "PM-1073", rating: "kW / kWh"]
tie = bus_tie [label: "CB-326", rating: "1600 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-399", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-728", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1416", rating: "SHOP LIGHTING / 31 kW"]
f2cb = breaker [label: "CB-380", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-724", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1420", rating: "AUXILIARY PANEL / 58 kW"]
f3cb = breaker [label: "CB-318", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-726", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1445", rating: "AUXILIARY PANEL / 78 kW"]

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
busB -> f2cb [cable: "3#4/0 AWG"]
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
