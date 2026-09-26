sld "GEN-0563 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-483", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1600", rating: "280 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-378", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-737", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1026", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 123 kW", voltage: "400Y/230V"]
mcbA2 = breaker [label: "CB-361", rating: "MCCB / 250 A / 3P"]
mctA2 = ct [label: "TA-766", rating: "3 CTs / 250/5 A"]
mpmA2 = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
f1cb = breaker [label: "CB-331", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-782", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1079", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1443", rating: "COMMON AREA LIGHTING / 22 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
