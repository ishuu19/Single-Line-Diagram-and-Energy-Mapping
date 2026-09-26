sld "GEN-1353 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-481", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1682", rating: "1390 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-383", rating: "MCCB / 2000 A / 3P"]
mctA1 = ct [label: "TA-708", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
f1cb = breaker [label: "CB-302", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-797", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1078", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-371", rating: "MCCB / 125 A / 3P"]
f1l1m = motor [label: "MTR-1143", rating: "50 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
mctA1 -> mpmA1
f1ct -> f1pm
