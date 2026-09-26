sld "GEN-0484 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-452", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1632", rating: "360 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-317", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-794", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1019", rating: "kW / kWh"]
busB = bus [label: "BUS-462", voltage: "208Y/120V"]
srcB1 = utility [label: "12.47kV SUPPLY B", voltage: "12.47kV"]
txB1 = transformer_yd [label: "TX-1620", rating: "360 kVA", voltage: "12.47kV / 208Y/120V"]
mcbB1 = breaker [label: "CB-398", rating: "ACB / 1000 A / 3P"]
mctB1 = ct [label: "TA-740", rating: "3 CTs / 1000/5 A"]
mpmB1 = watthour_meter [label: "PM-1053", rating: "kW / kWh"]
tie = bus_tie [label: "CB-361", rating: "400 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-350", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-765", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1095", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-342", rating: "MCCB / 80 A / 3P"]
f1l1m = motor [label: "MTR-1119", rating: "17 kW / COMP"]
f2cb = breaker [label: "CB-395", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-720", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f2pnl = hub [label: "FD-907", rating: "3P+N"]
f2l1cb = breaker [label: "CB-369", rating: "MCCB / 80 A / 3P"]
f2l1m = motor [label: "MTR-1115", rating: "17 kW / COMP"]
f2l2ld = load [label: "PNL-1408", rating: "AUXILIARY PANEL / 31 kW"]

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
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busB -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1m
f2pnl -> f2l2ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
