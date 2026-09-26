sld "GEN-1119 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-466", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1693", rating: "690 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-329", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-729", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f1cb = breaker [label: "CB-372", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-732", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1079", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1414", rating: "CELLAR PANEL / 14 kW"]
f2cb = breaker [label: "CB-304", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-728", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1043", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-360", rating: "MCCB / 40 A / 3P"]
f2l1m = motor [label: "MTR-1161", rating: "18 kW / COND"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
