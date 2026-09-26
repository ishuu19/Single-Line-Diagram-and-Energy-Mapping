sld "GEN-1262 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-435", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1600", rating: "1390 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-363", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-731", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1039", rating: "kW / kWh"]
busB = bus [label: "BUS-425", voltage: "400Y/230V"]
srcB1 = utility [label: "33kV SUPPLY B", voltage: "33kV"]
txB1 = transformer_dy [label: "TX-1668", rating: "690 kVA", voltage: "33kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-342", rating: "MCCB / 1000 A / 3P"]
mctB1 = ct [label: "TA-700", rating: "3 CTs / 1000/5 A"]
mpmB1 = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
tie = bus_tie [label: "CB-395", rating: "1600 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-316", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-703", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1478", rating: "GROW LIGHTING / 76 kW"]
f2cb = breaker [label: "CB-350", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-736", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1410", rating: "CONTROL PANEL / 14 kW"]
f3cb = breaker [label: "CB-370", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-735", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1401", rating: "AUXILIARY PANEL / 9 kW"]

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
busB -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
