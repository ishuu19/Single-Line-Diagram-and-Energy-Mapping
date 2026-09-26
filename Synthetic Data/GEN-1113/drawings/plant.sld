sld "GEN-1113 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-462", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1658", rating: "550 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-345", rating: "MCCB / 800 A / 3P"]
mctA1 = ct [label: "TA-757", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1048", rating: "kW / kWh"]
f1cb = breaker [label: "CB-375", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-749", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-362", rating: "MCCB / 63 A / 3P"]
f1l1m = motor [label: "MTR-1175", rating: "30 kW / COMP"]

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
