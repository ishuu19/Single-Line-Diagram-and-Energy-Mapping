sld "GEN-0893 — RETAIL FACILITY / ELECTRICAL DISTRIBUTION"
# STORE SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-479", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1630", rating: "550 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-312", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-780", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
busB = bus [label: "BUS-493", voltage: "400Y/230V"]
srcB1 = utility [label: "20kV SUPPLY B", voltage: "20kV"]
txB1 = transformer_yd [label: "TX-1635", rating: "1110 kVA", voltage: "20kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-382", rating: "ACB / 1600 A / 3P"]
mctB1 = ct [label: "TA-706", rating: "3 CTs / 1600/5 A"]
mpmB1 = watthour_meter [label: "PM-1045", rating: "kW / kWh"]
tie = bus_tie [label: "CB-381", rating: "800 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-329", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-701", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f1pnl = hub [label: "FD-922", rating: "3P+N"]
f1l1ld = load [label: "PNL-1496", rating: "AUXILIARY PANEL / 11 kW"]
f1l2cb = breaker [label: "CB-353", rating: "MCCB / 32 A / 3P"]
f1l2m = motor [label: "MTR-1188", rating: "15 kW / EF"]
f2cb = breaker [label: "CB-359", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-785", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1475", rating: "AUXILIARY PANEL / 16 kW"]

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
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2m
busB -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
