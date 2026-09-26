sld "GEN-1053 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-478", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1667", rating: "170 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-338", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-721", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1011", rating: "kW / kWh"]
busB = bus [label: "BUS-497", voltage: "400Y/230V"]
srcB1 = utility [label: "20kV SUPPLY B", voltage: "20kV"]
mcbB1 = breaker [label: "CB-359", rating: "ACB / 2000 A / 3P"]
mctB1 = ct [label: "TA-760", rating: "3 CTs / 2000/5 A"]
mpmB1 = watthour_meter [label: "PM-1066", rating: "kW / kWh"]
tie = bus_tie [label: "CB-316", rating: "800 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-390", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-732", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1068", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1408", rating: "CELLAR PANEL / 21 kW"]
f2cb = breaker [label: "CB-347", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-713", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1040", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1467", rating: "CELLAR PANEL / 18 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
