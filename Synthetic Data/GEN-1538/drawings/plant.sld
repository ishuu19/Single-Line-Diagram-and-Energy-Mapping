sld "GEN-1538 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-482", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1684", rating: "280 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-353", rating: "MCCB / 400 A / 3P"]
mctA1 = ct [label: "TA-706", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1073", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 146 kW", voltage: "400Y/230V"]
mcbA2 = breaker [label: "CB-384", rating: "MCCB / 630 A / 3P"]
mctA2 = ct [label: "TA-766", rating: "3 CTs / 630/5 A"]
mpmA2 = watthour_meter [label: "PM-1011", rating: "kW / kWh"]
f1cb = breaker [label: "CB-396", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-782", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1469", rating: "ACADEMIC BLOCK PANEL / 84 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
