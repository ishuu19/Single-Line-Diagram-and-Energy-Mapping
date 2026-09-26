sld "GEN-1432 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-479", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1646", rating: "520 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-307", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-715", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1042", rating: "kW / kWh"]
f1cb = breaker [label: "CB-304", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-704", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1062", rating: "kW / kWh"]
f1pnl = hub [label: "FD-936", rating: "3P+N"]
f1l1cb = breaker [label: "CB-301", rating: "MCCB / 125 A / 3P"]
f1l1drv = vfd [label: "DRV-869", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1105", rating: "62 kW / PROC"]
f1l2cb = breaker [label: "CB-382", rating: "MCCB / 125 A / 3P"]
f1l2drv = vfd [label: "DRV-890", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1198", rating: "61 kW / PROC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
mctA1 -> mpmA1
f1ct -> f1pm
