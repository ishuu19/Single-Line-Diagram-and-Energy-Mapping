sld "GEN-0487 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-417", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1644", rating: "1390 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-366", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-715", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1081", rating: "kW / kWh"]
f1cb = breaker [label: "CB-363", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-740", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1440", rating: "FORECOURT LIGHTING / 15 kW"]
f2cb = breaker [label: "CB-305", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-783", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1403", rating: "FORECOURT LIGHTING / 17 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
