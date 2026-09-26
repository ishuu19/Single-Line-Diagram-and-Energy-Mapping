sld "GEN-0758 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-404", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1688", rating: "230 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-398", rating: "MCCB / 630 A / 3P"]
mctA1 = ct [label: "TA-700", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1045", rating: "kW / kWh"]
f1cb = breaker [label: "CB-333", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-785", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1024", rating: "kW / kWh"]
f1pnl = hub [label: "FD-964", rating: "3P+N"]
f1l1cb = breaker [label: "CB-307", rating: "MCCB / 100 A / 3P"]
f1l1m = motor [label: "MTR-1127", rating: "22 kW / COMP"]
f1l2cb = breaker [label: "CB-345", rating: "MCCB / 400 A / 3P"]
f1l2drv = vfd [label: "DRV-865", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1185", rating: "86 kW / PROC"]
f1x = capacitor_bank [label: "CAP-668", rating: "94 kVAR"]

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
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
f1pnl -> f1x
mctA1 -> mpmA1
f1ct -> f1pm
