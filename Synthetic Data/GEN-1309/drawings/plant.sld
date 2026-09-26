sld "GEN-1309 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-425", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1697", rating: "440 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-329", rating: "MCCB / 630 A / 3P"]
mctA1 = ct [label: "TA-799", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1095", rating: "kW / kWh"]
f1cb = breaker [label: "CB-373", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-761", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-314", rating: "MCCB / 40 A / 3P"]
f1l1drv = vfd [label: "DRV-852", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1134", rating: "17 kW / PROC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
mctA1 -> mpmA1
f1ct -> f1pm
