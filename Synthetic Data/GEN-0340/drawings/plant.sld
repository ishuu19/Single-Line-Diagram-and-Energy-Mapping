sld "GEN-0340 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-416", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1647", rating: "1390 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-326", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-776", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1044", rating: "kW / kWh"]
srcA2 = utility [label: "11kV STANDBY", voltage: "11kV"]
txA2 = transformer_yd [label: "TX-1650", rating: "690 kVA", voltage: "11kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-396", rating: "ACB / 1000 A / 3P"]
mctA2 = ct [label: "TA-757", rating: "3 CTs / 1000/5 A"]
mpmA2 = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
f1cb = breaker [label: "CB-370", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-759", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1076", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1438", rating: "CANOPY AUXILIARIES / 29 kW"]
f2cb = breaker [label: "CB-338", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-782", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1428", rating: "CANOPY AUXILIARIES / 27 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
