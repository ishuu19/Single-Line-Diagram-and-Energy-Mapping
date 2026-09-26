sld "GEN-1539 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-407", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1627", rating: "1110 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-346", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-799", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
busB = bus [label: "BUS-490", voltage: "400Y/230V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "150 kW"]
mcbB1 = breaker [label: "CB-358", rating: "ACB / 250 A / 3P"]
mctB1 = ct [label: "TA-722", rating: "3 CTs / 250/5 A"]
mpmB1 = watthour_meter [label: "PM-1066", rating: "kW / kWh"]
tie = ats [label: "CB-385", rating: "2000 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-384", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-769", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1490", rating: "AUXILIARY PANEL / 10 kW"]
f2cb = breaker [label: "CB-340", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-792", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-344", rating: "MCCB / 40 A / 3P"]
f2l1m = motor [label: "MTR-1128", rating: "16 kW / EF"]
f3cb = breaker [label: "CB-313", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-715", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1424", rating: "FLOOR LIGHTING / 67 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
busB -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
