sld "GEN-0132 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-443", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
mcbA1 = breaker [label: "CB-387", rating: "MCCB / 1000 A / 3P"]
mctA1 = ct [label: "TA-720", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1021", rating: "kW / kWh"]
f1cb = breaker [label: "CB-344", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-728", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1003", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-311", rating: "MCCB / 63 A / 3P"]
f1l1drv = vfd [label: "DRV-851", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1159", rating: "30 kW / PROC"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
mctA1 -> mpmA1
f1ct -> f1pm
