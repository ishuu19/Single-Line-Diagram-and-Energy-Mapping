sld "GEN-0314 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-470", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1682", rating: "90 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-368", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-740", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
busB = bus [label: "BUS-457", voltage: "208Y/120V"]
srcB1 = utility [label: "12.47kV SUPPLY B", voltage: "12.47kV"]
txB1 = transformer_yd [label: "TX-1695", rating: "720 kVA", voltage: "12.47kV / 208Y/120V"]
mcbB1 = breaker [label: "CB-328", rating: "ACB / 2000 A / 3P"]
mctB1 = ct [label: "TA-745", rating: "3 CTs / 2000/5 A"]
mpmB1 = watthour_meter [label: "PM-1007", rating: "kW / kWh"]
tie = bus_tie [label: "CB-369", rating: "1600 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-314", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-734", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f1pnl = hub [label: "FD-968", rating: "3P+N"]
f1l1ld = load [label: "PNL-1477", rating: "SHOP LIGHTING / 15 kW"]
f1l2ld = load [label: "PNL-1464", rating: "AUXILIARY PANEL / 26 kW"]
f2cb = breaker [label: "CB-348", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-747", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1057", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-358", rating: "MCCB / 160 A / 3P"]
f2l1drv = vfd [label: "DRV-869", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1159", rating: "36 kW / PROC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> txB1
txB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busB -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
