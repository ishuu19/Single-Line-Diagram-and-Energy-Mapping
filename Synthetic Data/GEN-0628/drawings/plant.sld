sld "GEN-0628 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-468", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1601", rating: "330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-379", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-758", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 465 kW", voltage: "480Y/277V"]
mcbA2 = breaker [label: "CB-386", rating: "MCCB / 800 A / 3P"]
mctA2 = ct [label: "TA-753", rating: "3 CTs / 800/5 A"]
mpmA2 = watthour_meter [label: "PM-1041", rating: "kW / kWh"]
f1cb = breaker [label: "CB-353", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-780", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1051", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1497", rating: "CANOPY AUXILIARIES / 16 kW"]
f2cb = breaker [label: "CB-365", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-712", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1025", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1455", rating: "FORECOURT LIGHTING / 14 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
