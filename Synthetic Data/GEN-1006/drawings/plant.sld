sld "GEN-1006 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-476", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1639", rating: "1390 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-319", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-736", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
busB = bus [label: "BUS-436", voltage: "400Y/230V"]
srcB1 = utility [label: "20kV SUPPLY B", voltage: "20kV"]
txB1 = transformer_yd [label: "TX-1668", rating: "1390 kVA", voltage: "20kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-356", rating: "MCCB / 2000 A / 3P"]
mctB1 = ct [label: "TA-773", rating: "3 CTs / 2000/5 A"]
mpmB1 = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
tie = bus_tie [label: "CB-351", rating: "2000 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-390", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-771", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1069", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1476", rating: "CONTROL PANEL / 13 kW"]
f2cb = breaker [label: "CB-393", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-748", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1098", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1469", rating: "AUXILIARY PANEL / 8 kW"]
f3cb = breaker [label: "CB-320", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-704", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1453", rating: "AUXILIARY PANEL / 17 kW"]

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
busB -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
