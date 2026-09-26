sld "GEN-0787 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-413", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1641", rating: "280 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-368", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-755", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1030", rating: "kW / kWh"]
busB = bus [label: "BUS-444", voltage: "400Y/230V"]
srcB1 = utility [label: "6.6kV SUPPLY B", voltage: "6.6kV"]
txB1 = transformer_yd [label: "TX-1655", rating: "1390 kVA", voltage: "6.6kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-374", rating: "ACB / 2000 A / 3P"]
mctB1 = ct [label: "TA-797", rating: "3 CTs / 2000/5 A"]
mpmB1 = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
tie = bus_tie [label: "CB-371", rating: "2000 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-364", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-754", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1095", rating: "kW / kWh"]
f1pnl = hub [label: "FD-988", rating: "3P+N"]
f1l1ld = load [label: "PNL-1476", rating: "PACKAGING PANEL / 10 kW"]
f1l2ld = load [label: "PNL-1475", rating: "PACKAGING PANEL / 28 kW"]
f2cb = breaker [label: "CB-355", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-747", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1060", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-332", rating: "MCCB / 80 A / 3P"]
f2l1m = motor [label: "MTR-1100", rating: "34 kW / COMP"]
f2x = harmonic_filter [label: "HF-542", rating: "5th / 7th"]

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
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busB -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
f2ct -> f2x
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
