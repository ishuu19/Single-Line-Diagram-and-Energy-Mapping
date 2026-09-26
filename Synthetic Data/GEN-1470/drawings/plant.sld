sld "GEN-1470 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-493", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1615", rating: "1390 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-318", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-756", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f1cb = breaker [label: "CB-399", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-796", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1420", rating: "PRESS FLOOR PANEL / 26 kW"]
f2cb = breaker [label: "CB-359", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-766", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1054", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1419", rating: "PRESS FLOOR PANEL / 34 kW"]
f3cb = breaker [label: "CB-395", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-791", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1029", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1474", rating: "SHOP LIGHTING / 17 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
