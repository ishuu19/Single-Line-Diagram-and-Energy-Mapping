sld "GEN-0508 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-497", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1659", rating: "170 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-376", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-719", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1043", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 385 kW", voltage: "400Y/230V"]
mcbA2 = breaker [label: "CB-338", rating: "MCCB / 160 A / 3P"]
mctA2 = ct [label: "TA-756", rating: "3 CTs / 160/5 A"]
mpmA2 = watthour_meter [label: "PM-1078", rating: "kW / kWh"]
f1cb = breaker [label: "CB-370", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-743", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1426", rating: "CANOPY AUXILIARIES / 25 kW"]
f2cb = breaker [label: "CB-302", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-779", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1441", rating: "FORECOURT LIGHTING / 25 kW"]
f3cb = breaker [label: "CB-385", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-729", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1072", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1470", rating: "FORECOURT LIGHTING / 21 kW"]

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
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
