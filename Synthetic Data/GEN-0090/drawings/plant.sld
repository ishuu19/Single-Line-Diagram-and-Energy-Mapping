sld "GEN-0090 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-422", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1622", rating: "280 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-394", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-707", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1076", rating: "kW / kWh"]
f1cb = breaker [label: "CB-374", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-700", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1077", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1457", rating: "PRESS FLOOR PANEL / 18 kW"]
f2cb = breaker [label: "CB-356", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-794", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1410", rating: "SHOP LIGHTING / 15 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
