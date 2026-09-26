sld "GEN-0794 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-417", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1685", rating: "1110 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-315", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-797", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1097", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 327 kW", voltage: "400Y/230V"]
mcbA2 = breaker [label: "CB-334", rating: "MCCB / 250 A / 3P"]
mctA2 = ct [label: "TA-739", rating: "3 CTs / 250/5 A"]
mpmA2 = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
f1cb = breaker [label: "CB-388", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-721", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1484", rating: "FORECOURT LIGHTING / 16 kW"]
f2cb = breaker [label: "CB-327", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-746", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1077", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1410", rating: "CANOPY AUXILIARIES / 33 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
