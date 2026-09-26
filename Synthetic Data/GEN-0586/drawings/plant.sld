sld "GEN-0586 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-429", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1696", rating: "440 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-310", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-709", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
busB = bus [label: "BUS-480", voltage: "400Y/230V"]
srcB1 = utility [label: "20kV SUPPLY B", voltage: "20kV"]
txB1 = transformer_dy [label: "TX-1680", rating: "440 kVA", voltage: "20kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-392", rating: "ACB / 630 A / 3P"]
mctB1 = ct [label: "TA-710", rating: "3 CTs / 630/5 A"]
mpmB1 = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
tie = bus_tie [label: "CB-358", rating: "1600 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-333", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-761", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1425", rating: "AUXILIARY PANEL / 24 kW"]
f2cb = breaker [label: "CB-366", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-731", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1046", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1473", rating: "PRESS FLOOR PANEL / 28 kW"]
f3cb = breaker [label: "CB-360", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-764", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1037", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1472", rating: "SHOP LIGHTING / 14 kW"]

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
busA -> f2cb [cable: "3#1/0 AWG"]
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
