sld "GEN-0742 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-464", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1620", rating: "1390 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-357", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-734", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1045", rating: "kW / kWh"]
srcA2 = utility [label: "20kV STANDBY", voltage: "20kV"]
txA2 = transformer_dy [label: "TX-1636", rating: "280 kVA", voltage: "20kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-381", rating: "ACB / 400 A / 3P"]
mctA2 = ct [label: "TA-797", rating: "3 CTs / 400/5 A"]
mpmA2 = watthour_meter [label: "PM-1029", rating: "kW / kWh"]
f1cb = breaker [label: "CB-309", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-792", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1097", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1427", rating: "AUXILIARY PANEL / 45 kW"]
f2cb = breaker [label: "CB-340", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-746", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-384", rating: "MCCB / 63 A / 3P"]
f2l1drv = vfd [label: "DRV-815", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1156", rating: "25 kW / PROC"]
f3cb = breaker [label: "CB-307", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-767", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1043", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1417", rating: "CELLAR PANEL / 10 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
