sld "GEN-0121 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-424", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1618", rating: "1390 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-399", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-764", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1015", rating: "kW / kWh"]
f1cb = breaker [label: "CB-337", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-720", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1004", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1464", rating: "PRESS FLOOR PANEL / 29 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
f1ct -> f1pm
