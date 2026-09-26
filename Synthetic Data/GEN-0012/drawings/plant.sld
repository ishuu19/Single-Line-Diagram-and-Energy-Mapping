sld "GEN-0012 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-455", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1606", rating: "280 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-310", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-776", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1032", rating: "kW / kWh"]
busB = bus [label: "BUS-445", voltage: "400Y/230V"]
srcB1 = utility [label: "20kV SUPPLY B", voltage: "20kV"]
txB1 = transformer_yd [label: "TX-1608", rating: "280 kVA", voltage: "20kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-327", rating: "ACB / 400 A / 3P"]
mctB1 = ct [label: "TA-788", rating: "3 CTs / 400/5 A"]
mpmB1 = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
tie = bus_tie [label: "CB-342", rating: "2000 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-397", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-720", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1472", rating: "AUXILIARY PANEL / 26 kW"]
f2cb = breaker [label: "CB-394", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-744", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1413", rating: "SHOP LIGHTING / 21 kW"]
f3cb = breaker [label: "CB-347", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-741", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1041", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1445", rating: "PRESS FLOOR PANEL / 32 kW"]

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
