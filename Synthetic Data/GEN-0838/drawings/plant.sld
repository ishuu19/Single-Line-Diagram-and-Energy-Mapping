sld "GEN-0838 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-460", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1673", rating: "280 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-364", rating: "MCCB / 400 A / 3P"]
mctA1 = ct [label: "TA-777", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1063", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 571 kW", voltage: "400Y/230V"]
mcbA2 = breaker [label: "CB-392", rating: "MCCB / 160 A / 3P"]
mctA2 = ct [label: "TA-730", rating: "3 CTs / 160/5 A"]
mpmA2 = watthour_meter [label: "PM-1077", rating: "kW / kWh"]
f1cb = breaker [label: "CB-310", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-779", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1043", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1412", rating: "CANOPY AUXILIARIES / 20 kW"]
f2cb = breaker [label: "CB-372", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-753", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1490", rating: "CANOPY AUXILIARIES / 19 kW"]
f3cb = breaker [label: "CB-393", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-798", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1042", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1476", rating: "CANOPY AUXILIARIES / 22 kW"]

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
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
