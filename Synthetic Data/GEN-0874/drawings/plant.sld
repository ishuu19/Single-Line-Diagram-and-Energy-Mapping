sld "GEN-0874 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-432", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
mcbA1 = breaker [label: "CB-309", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-761", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1078", rating: "kW / kWh"]
busB = bus [label: "BUS-400", voltage: "400Y/230V"]
srcB1 = utility [label: "22kV SUPPLY B", voltage: "22kV"]
txB1 = transformer_dy [label: "TX-1656", rating: "440 kVA", voltage: "22kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-348", rating: "ACB / 630 A / 3P"]
mctB1 = ct [label: "TA-795", rating: "3 CTs / 630/5 A"]
mpmB1 = watthour_meter [label: "PM-1011", rating: "kW / kWh"]
tie = bus_tie [label: "CB-306", rating: "400 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-341", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-720", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
f1pnl = hub [label: "FD-976", rating: "3P+N"]
f1l1ld = load [label: "PNL-1435", rating: "SHOP LIGHTING / 23 kW"]
f1l2cb = breaker [label: "CB-307", rating: "MCCB / 80 A / 3P"]
f1l2m = motor [label: "MTR-1107", rating: "33 kW / COMP"]
f2cb = breaker [label: "CB-392", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-726", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-340", rating: "MCCB / 63 A / 3P"]
f2l1m = motor [label: "MTR-1141", rating: "26 kW / COMP"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> txB1
txB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2m
busB -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
