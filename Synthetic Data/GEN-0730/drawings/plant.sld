sld "GEN-0730 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-414", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
mcbA1 = breaker [label: "CB-315", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-780", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1066", rating: "kW / kWh"]
srcA2 = utility [label: "11kV STANDBY", voltage: "11kV"]
txA2 = transformer_dy [label: "TX-1680", rating: "1390 kVA", voltage: "11kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-328", rating: "MCCB / 2000 A / 3P"]
mctA2 = ct [label: "TA-796", rating: "3 CTs / 2000/5 A"]
mpmA2 = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
f1cb = breaker [label: "CB-366", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-773", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1078", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1473", rating: "PRESS FLOOR PANEL / 16 kW"]
f2cb = breaker [label: "CB-386", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-740", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1062", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1419", rating: "PRESS FLOOR PANEL / 40 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
