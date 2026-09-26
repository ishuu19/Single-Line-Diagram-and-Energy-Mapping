sld "GEN-1215 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-457", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1638", rating: "440 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-381", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-775", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1040", rating: "kW / kWh"]
srcA2 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "1250 kW"]
mcbA2 = breaker [label: "CB-389", rating: "MCCB / 2000 A / 3P"]
mctA2 = ct [label: "TA-764", rating: "3 CTs / 2000/5 A"]
mpmA2 = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
f1cb = breaker [label: "CB-373", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-788", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1056", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-329", rating: "MCCB / 32 A / 3P"]
f1l1m = motor [label: "MTR-1111", rating: "14 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
