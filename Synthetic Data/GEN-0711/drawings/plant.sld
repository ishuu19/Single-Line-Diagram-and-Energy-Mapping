sld "GEN-0711 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-446", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1688", rating: "280 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-333", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-768", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
f1cb = breaker [label: "CB-365", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-720", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1097", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-346", rating: "MCCB / 50 A / 3P"]
f1l1m = motor [label: "MTR-1145", rating: "20 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
mctA1 -> mpmA1
f1ct -> f1pm
