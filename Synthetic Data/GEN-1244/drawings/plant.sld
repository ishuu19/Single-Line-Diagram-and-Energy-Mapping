sld "GEN-1244 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-433", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1681", rating: "550 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-334", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-784", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1020", rating: "kW / kWh"]
busB = bus [label: "BUS-406", voltage: "400Y/230V"]
srcB1 = utility [label: "33kV SUPPLY B", voltage: "33kV"]
txB1 = transformer_dy [label: "TX-1620", rating: "550 kVA", voltage: "33kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-359", rating: "ACB / 800 A / 3P"]
mctB1 = ct [label: "TA-739", rating: "3 CTs / 800/5 A"]
mpmB1 = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
tie = bus_tie [label: "CB-345", rating: "800 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-324", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-729", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1067", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1461", rating: "ADMIN PANEL / 50 kW"]
f2cb = breaker [label: "CB-319", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-701", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1003", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1455", rating: "ADMIN PANEL / 46 kW"]
f3cb = breaker [label: "CB-379", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-789", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1021", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1423", rating: "AUXILIARY PANEL / 11 kW"]

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
busB -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
