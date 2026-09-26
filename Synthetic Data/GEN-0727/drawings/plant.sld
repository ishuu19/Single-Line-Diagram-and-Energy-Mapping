sld "GEN-0727 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-462", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
mcbA1 = breaker [label: "CB-383", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-798", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f1cb = breaker [label: "CB-320", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-717", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1000", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-353", rating: "MCCB / 63 A / 3P"]
f1l1m = motor [label: "MTR-1106", rating: "27 kW / COMP"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
mctA1 -> mpmA1
f1ct -> f1pm
