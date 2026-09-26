sld "GEN-0023 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-483", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1618", rating: "1110 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-326", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-723", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
f1cb = breaker [label: "CB-353", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-746", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f1pnl = hub [label: "FD-989", rating: "3P+N"]
f1l1cb = breaker [label: "CB-336", rating: "MCCB / 40 A / 3P"]
f1l1drv = vfd [label: "DRV-894", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1111", rating: "17 kW / PROC"]
f1l2cb = breaker [label: "CB-385", rating: "MCCB / 63 A / 3P"]
f1l2m = motor [label: "MTR-1130", rating: "27 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2m
mctA1 -> mpmA1
f1ct -> f1pm
