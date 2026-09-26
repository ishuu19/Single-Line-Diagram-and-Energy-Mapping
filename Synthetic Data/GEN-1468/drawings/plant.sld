sld "GEN-1468 — RETAIL FACILITY / ELECTRICAL DISTRIBUTION"
# STORE SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-467", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1609", rating: "1390 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-345", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-707", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1016", rating: "kW / kWh"]
busB = bus [label: "BUS-421", voltage: "400Y/230V"]
srcB1 = utility [label: "6.6kV SUPPLY B", voltage: "6.6kV"]
txB1 = transformer_dy [label: "TX-1695", rating: "280 kVA", voltage: "6.6kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-346", rating: "ACB / 400 A / 3P"]
mctB1 = ct [label: "TA-778", rating: "3 CTs / 400/5 A"]
mpmB1 = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
tie = bus_tie [label: "CB-307", rating: "1000 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-362", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-759", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-306", rating: "MCCB / 32 A / 3P"]
f1l1drv = vfd [label: "DRV-838", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1119", rating: "15 kW / AHU"]
f2cb = breaker [label: "CB-353", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-779", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1068", rating: "kW / kWh"]
f2pnl = hub [label: "FD-928", rating: "3P+N"]
f2l1ld = load [label: "PNL-1474", rating: "HOUSE PANEL / 67 kW"]
f2l2ld = load [label: "PNL-1417", rating: "HOUSE PANEL / 59 kW"]

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
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busB -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
