sld "GEN-1207 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-493", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1633", rating: "170 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-303", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-725", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1068", rating: "kW / kWh"]
busB = bus [label: "BUS-497", voltage: "400Y/230V"]
srcB1 = utility [label: "11kV SUPPLY B", voltage: "11kV"]
txB1 = transformer_dy [label: "TX-1692", rating: "280 kVA", voltage: "11kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-373", rating: "ACB / 400 A / 3P"]
mctB1 = ct [label: "TA-728", rating: "3 CTs / 400/5 A"]
mpmB1 = watthour_meter [label: "PM-1047", rating: "kW / kWh"]
tie = bus_tie [label: "CB-386", rating: "630 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-368", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-729", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1025", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1489", rating: "CANOPY AUXILIARIES / 27 kW"]
f2cb = breaker [label: "CB-334", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-791", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1066", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1422", rating: "FORECOURT LIGHTING / 11 kW"]
f3cb = breaker [label: "CB-387", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-767", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1081", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1459", rating: "CANOPY AUXILIARIES / 31 kW"]

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
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#4 AWG"]
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
