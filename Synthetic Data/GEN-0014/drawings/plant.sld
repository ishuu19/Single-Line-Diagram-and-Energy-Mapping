sld "GEN-0014 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-444", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1689", rating: "90 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-329", rating: "MCCB / 250 A / 3P"]
mctA1 = ct [label: "TA-765", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
busB = bus [label: "BUS-477", voltage: "208Y/120V"]
srcB1 = utility [label: "12.47kV SUPPLY B", voltage: "12.47kV"]
txB1 = transformer_dy [label: "TX-1606", rating: "140 kVA", voltage: "12.47kV / 208Y/120V"]
mcbB1 = breaker [label: "CB-354", rating: "ACB / 400 A / 3P"]
mctB1 = ct [label: "TA-775", rating: "3 CTs / 400/5 A"]
mpmB1 = watthour_meter [label: "PM-1088", rating: "kW / kWh"]
tie = bus_tie [label: "CB-330", rating: "630 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-341", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-749", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1026", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-361", rating: "MCCB / 100 A / 3P"]
f1l1m = motor [label: "MTR-1114", rating: "24 kW / RWP"]
f2cb = breaker [label: "CB-385", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-767", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-342", rating: "MCCB / 50 A / 3P"]
f2l1drv = vfd [label: "DRV-844", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1166", rating: "12 kW / EF"]

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
f1l1cb -> f1l1m
busB -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
