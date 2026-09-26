sld "GEN-1321 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-440", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1634", rating: "170 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-337", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-781", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1087", rating: "kW / kWh"]
busB = bus [label: "BUS-436", voltage: "400Y/230V"]
srcB1 = utility [label: "33kV SUPPLY B", voltage: "33kV"]
txB1 = transformer_yd [label: "TX-1661", rating: "1390 kVA", voltage: "33kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-365", rating: "ACB / 2000 A / 3P"]
mctB1 = ct [label: "TA-745", rating: "3 CTs / 2000/5 A"]
mpmB1 = watthour_meter [label: "PM-1040", rating: "kW / kWh"]
tie = bus_tie [label: "CB-319", rating: "1000 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-358", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-775", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1442", rating: "SHOP LIGHTING / 19 kW"]
f2cb = breaker [label: "CB-315", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-752", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1068", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1484", rating: "SHOP LIGHTING / 25 kW"]
f3cb = breaker [label: "CB-363", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-705", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1073", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1462", rating: "AUXILIARY PANEL / 35 kW"]

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
busA -> f2cb [cable: "3#4 AWG"]
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
