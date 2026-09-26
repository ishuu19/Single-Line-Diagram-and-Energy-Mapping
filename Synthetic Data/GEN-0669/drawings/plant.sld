sld "GEN-0669 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-473", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1654", rating: "1390 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-336", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-730", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
busB = bus [label: "BUS-476", voltage: "400Y/230V"]
srcB1 = utility [label: "6.6kV SUPPLY B", voltage: "6.6kV"]
txB1 = transformer_dy [label: "TX-1685", rating: "550 kVA", voltage: "6.6kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-376", rating: "ACB / 800 A / 3P"]
mctB1 = ct [label: "TA-704", rating: "3 CTs / 800/5 A"]
mpmB1 = watthour_meter [label: "PM-1013", rating: "kW / kWh"]
tie = bus_tie [label: "CB-370", rating: "1000 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-399", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-734", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1483", rating: "AUXILIARY PANEL / 16 kW"]
f2cb = breaker [label: "CB-327", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-794", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1016", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1473", rating: "AUXILIARY PANEL / 30 kW"]
f3cb = breaker [label: "CB-300", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-733", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1051", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1444", rating: "AUXILIARY PANEL / 26 kW"]

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
busB -> f2cb [cable: "3#1/0 AWG"]
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
