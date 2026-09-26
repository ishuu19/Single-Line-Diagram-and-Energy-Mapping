sld "GEN-0577 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-496", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1664", rating: "230 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-326", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-751", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1081", rating: "kW / kWh"]
busB = bus [label: "BUS-460", voltage: "208Y/120V"]
srcB1 = utility [label: "12.47kV SUPPLY B", voltage: "12.47kV"]
txB1 = transformer_dy [label: "TX-1668", rating: "140 kVA", voltage: "12.47kV / 208Y/120V"]
mcbB1 = breaker [label: "CB-374", rating: "MCCB / 400 A / 3P"]
mctB1 = ct [label: "TA-707", rating: "3 CTs / 400/5 A"]
mpmB1 = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
tie = bus_tie [label: "CB-335", rating: "2000 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-381", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-798", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1437", rating: "GROW LIGHTING / 56 kW"]
f2cb = breaker [label: "CB-370", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-701", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
f2pnl = hub [label: "FD-971", rating: "3P+N"]
f2l1ld = load [label: "PNL-1418", rating: "CONTROL PANEL / 16 kW"]
f2l2cb = breaker [label: "CB-358", rating: "MCCB / 32 A / 3P"]
f2l2drv = vfd [label: "DRV-832", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1181", rating: "8 kW / EF"]

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
