sld "GEN-1066 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-455", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1680", rating: "90 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-305", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-768", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1090", rating: "kW / kWh"]
busB = bus [label: "BUS-433", voltage: "208Y/120V"]
srcB1 = utility [label: "12.47kV SUPPLY B", voltage: "12.47kV"]
txB1 = transformer_yd [label: "TX-1621", rating: "230 kVA", voltage: "12.47kV / 208Y/120V"]
mcbB1 = breaker [label: "CB-374", rating: "MCCB / 630 A / 3P"]
mctB1 = ct [label: "TA-757", rating: "3 CTs / 630/5 A"]
mpmB1 = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
tie = bus_tie [label: "CB-352", rating: "2000 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-326", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-759", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1047", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1432", rating: "AUXILIARY PANEL / 11 kW"]
f2cb = breaker [label: "CB-321", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-733", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
f2pnl = hub [label: "FD-926", rating: "3P+N"]
f2l1ld = load [label: "PNL-1468", rating: "SHELTER LIGHTING / 6 kW"]
f2l2cb = breaker [label: "CB-348", rating: "MCCB / 32 A / 3P"]
f2l2drv = vfd [label: "DRV-874", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1135", rating: "8 kW / CRAC"]

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
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2cb
f2l2cb -> f2l2drv
f2l2drv -> f2l2m
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
