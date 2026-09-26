sld "GEN-1283 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-446", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1660", rating: "1390 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-330", rating: "MCCB / 2000 A / 3P"]
mctA1 = ct [label: "TA-791", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 297 kW", voltage: "400Y/230V"]
mcbA2 = breaker [label: "CB-305", rating: "MCCB / 630 A / 3P"]
mctA2 = ct [label: "TA-766", rating: "3 CTs / 630/5 A"]
mpmA2 = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f1cb = breaker [label: "CB-375", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-752", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1050", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1429", rating: "RISER PANEL / 85 kW"]

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
