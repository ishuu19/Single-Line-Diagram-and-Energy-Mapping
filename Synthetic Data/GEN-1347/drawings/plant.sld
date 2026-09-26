sld "GEN-1347 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-408", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1615", rating: "360 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-323", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-778", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1078", rating: "kW / kWh"]
busB = bus [label: "BUS-404", voltage: "208Y/120V"]
srcB1 = utility [label: "12.47kV SUPPLY B", voltage: "12.47kV"]
txB1 = transformer_dy [label: "TX-1619", rating: "140 kVA", voltage: "12.47kV / 208Y/120V"]
mcbB1 = breaker [label: "CB-302", rating: "ACB / 400 A / 3P"]
mctB1 = ct [label: "TA-738", rating: "3 CTs / 400/5 A"]
mpmB1 = watthour_meter [label: "PM-1025", rating: "kW / kWh"]
tie = bus_tie [label: "CB-382", rating: "1000 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-324", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-741", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1014", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-372", rating: "MCCB / 200 A / 3P"]
f1l1drv = vfd [label: "DRV-878", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1115", rating: "42 kW / PROC"]
f2cb = breaker [label: "CB-396", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-708", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1033", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-315", rating: "MCCB / 100 A / 3P"]
f2l1drv = vfd [label: "DRV-856", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1163", rating: "22 kW / PROC"]

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
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busB -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
