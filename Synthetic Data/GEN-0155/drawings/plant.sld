sld "GEN-0155 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-462", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1686", rating: "280 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-336", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-774", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f1cb = breaker [label: "CB-365", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-732", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1000", rating: "kW / kWh"]
f1pnl = hub [label: "FD-975", rating: "3P+N"]
f1l1cb = breaker [label: "CB-347", rating: "MCCB / 63 A / 3P"]
f1l1m = motor [label: "MTR-1127", rating: "26 kW / COND"]
f1l2cb = breaker [label: "CB-328", rating: "MCCB / 63 A / 3P"]
f1l2m = motor [label: "MTR-1197", rating: "25 kW / COND"]
f1x = harmonic_filter [label: "HF-528", rating: "5th / 7th"]
f2cb = breaker [label: "CB-300", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-793", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-307", rating: "MCCB / 125 A / 3P"]
f2l1drv = vfd [label: "DRV-853", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1148", rating: "50 kW / PROC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2m
f1pnl -> f1x
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
