sld "GEN-0696 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-422", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1631", rating: "290 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-363", rating: "MCCB / 800 A / 3P"]
mctA1 = ct [label: "TA-785", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1025", rating: "kW / kWh"]
f1cb = breaker [label: "CB-385", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-707", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1095", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-315", rating: "MCCB / 125 A / 3P"]
f1l1drv = vfd [label: "DRV-825", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1128", rating: "29 kW / PROC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
mctA1 -> mpmA1
f1ct -> f1pm
