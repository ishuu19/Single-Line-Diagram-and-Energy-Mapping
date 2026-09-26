sld "GEN-1425 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-481", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1608", rating: "1390 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-374", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-700", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1062", rating: "kW / kWh"]
busB = bus [label: "BUS-474", voltage: "400Y/230V"]
srcB1 = utility [label: "20kV SUPPLY B", voltage: "20kV"]
txB1 = transformer_yd [label: "TX-1610", rating: "690 kVA", voltage: "20kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-391", rating: "ACB / 1000 A / 3P"]
mctB1 = ct [label: "TA-745", rating: "3 CTs / 1000/5 A"]
mpmB1 = watthour_meter [label: "PM-1033", rating: "kW / kWh"]
tie = bus_tie [label: "CB-370", rating: "800 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-346", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-742", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1044", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1487", rating: "AUXILIARY PANEL / 16 kW"]
f2cb = breaker [label: "CB-354", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-730", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1020", rating: "kW / kWh"]
f2pnl = hub [label: "FD-934", rating: "3P+N"]
f2l1ld = load [label: "PNL-1478", rating: "AUXILIARY PANEL / 25 kW"]
f2l2cb = breaker [label: "CB-305", rating: "MCCB / 80 A / 3P"]
f2l2drv = vfd [label: "DRV-852", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1157", rating: "38 kW / BLOW"]

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
f1ct -> f1l1ld
busB -> f2cb [cable: "3#4/0 AWG"]
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
