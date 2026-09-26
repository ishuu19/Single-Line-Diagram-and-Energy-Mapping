sld "GEN-1030 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-443", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1665", rating: "140 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-326", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-708", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1069", rating: "kW / kWh"]
busB = bus [label: "BUS-425", voltage: "208Y/120V"]
srcB1 = utility [label: "12.47kV SUPPLY B", voltage: "12.47kV"]
txB1 = transformer_dy [label: "TX-1645", rating: "140 kVA", voltage: "12.47kV / 208Y/120V"]
mcbB1 = breaker [label: "CB-306", rating: "MCCB / 400 A / 3P"]
mctB1 = ct [label: "TA-740", rating: "3 CTs / 400/5 A"]
mpmB1 = watthour_meter [label: "PM-1050", rating: "kW / kWh"]
tie = bus_tie [label: "CB-320", rating: "2000 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-332", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-784", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1094", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-315", rating: "MCCB / 50 A / 3P"]
f1l1drv = vfd [label: "DRV-860", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1162", rating: "12 kW / CRAC"]
f2cb = breaker [label: "CB-361", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-707", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1078", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-335", rating: "MCCB / 50 A / 3P"]
f2l1drv = vfd [label: "DRV-843", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1160", rating: "11 kW / CRAC"]

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
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busB -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
