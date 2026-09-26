sld "GEN-0653 — RETAIL FACILITY / ELECTRICAL DISTRIBUTION"
# STORE SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-401", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1653", rating: "280 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-300", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-760", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
busB = bus [label: "BUS-446", voltage: "400Y/230V"]
srcB1 = utility [label: "20kV SUPPLY B", voltage: "20kV"]
txB1 = transformer_yd [label: "TX-1654", rating: "1110 kVA", voltage: "20kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-386", rating: "ACB / 1600 A / 3P"]
mctB1 = ct [label: "TA-713", rating: "3 CTs / 1600/5 A"]
mpmB1 = watthour_meter [label: "PM-1015", rating: "kW / kWh"]
tie = bus_tie [label: "CB-394", rating: "1000 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-301", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-729", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-303", rating: "MCCB / 25 A / 3P"]
f1l1m = motor [label: "MTR-1173", rating: "10 kW / EF"]
f2cb = breaker [label: "CB-397", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-754", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f2pnl = hub [label: "FD-965", rating: "3P+N"]
f2l1ld = load [label: "PNL-1478", rating: "AUXILIARY PANEL / 14 kW"]
f2l2ld = load [label: "PNL-1444", rating: "HOUSE PANEL / 47 kW"]

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
busB -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
