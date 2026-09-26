sld "GEN-1184 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-447", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1640", rating: "690 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-317", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-724", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
f1cb = breaker [label: "CB-393", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-792", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1067", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-359", rating: "MCCB / 32 A / 3P"]
f1l1m = motor [label: "MTR-1192", rating: "15 kW / COMP"]

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
