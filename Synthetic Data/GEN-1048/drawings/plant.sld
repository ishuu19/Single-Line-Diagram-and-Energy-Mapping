sld "GEN-1048 — RETAIL FACILITY / ELECTRICAL DISTRIBUTION"
# STORE SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-464", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
mcbA1 = breaker [label: "CB-354", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-707", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
busB = bus [label: "BUS-449", voltage: "400Y/230V"]
srcB1 = utility [label: "6.6kV SUPPLY B", voltage: "6.6kV"]
mcbB1 = breaker [label: "CB-324", rating: "MCCB / 630 A / 3P"]
mctB1 = ct [label: "TA-798", rating: "3 CTs / 630/5 A"]
mpmB1 = watthour_meter [label: "PM-1062", rating: "kW / kWh"]
tie = bus_tie [label: "CB-365", rating: "630 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-393", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-735", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1088", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1490", rating: "SALES FLOOR LIGHTING / 36 kW"]
f2cb = breaker [label: "CB-368", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-799", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1000", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1405", rating: "AUXILIARY PANEL / 29 kW"]
f3cb = breaker [label: "CB-390", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-716", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
f3pnl = hub [label: "FD-915", rating: "3P+N"]
f3l1ld = load [label: "PNL-1473", rating: "AUXILIARY PANEL / 8 kW"]
f3l2ld = load [label: "PNL-1492", rating: "AUXILIARY PANEL / 15 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
