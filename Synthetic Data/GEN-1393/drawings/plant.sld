sld "GEN-1393 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-489", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
mcbA1 = breaker [label: "CB-334", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-795", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1062", rating: "kW / kWh"]
f1cb = breaker [label: "CB-353", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-791", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1039", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-336", rating: "MCCB / 125 A / 3P"]
f1l1drv = vfd [label: "DRV-877", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1176", rating: "55 kW / PROC"]
f2cb = breaker [label: "CB-364", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-722", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1069", rating: "kW / kWh"]
f2pnl = hub [label: "FD-964", rating: "3P+N"]
f2l1cb = breaker [label: "CB-311", rating: "MCCB / 125 A / 3P"]
f2l1drv = vfd [label: "DRV-879", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1106", rating: "61 kW / PROC"]
f2l2cb = breaker [label: "CB-342", rating: "MCCB / 125 A / 3P"]
f2l2m = motor [label: "MTR-1128", rating: "55 kW / COMP"]
f2x = harmonic_filter [label: "HF-543", rating: "5th / 7th"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
f2pnl -> f2l2cb
f2l2cb -> f2l2m
f2pnl -> f2x
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
