sld "GEN-0769 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-455", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1625", rating: "550 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-368", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-748", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1017", rating: "kW / kWh"]
busB = bus [label: "BUS-430", voltage: "400Y/230V"]
srcB1 = utility [label: "6.6kV SUPPLY B", voltage: "6.6kV"]
txB1 = transformer_dy [label: "TX-1647", rating: "1110 kVA", voltage: "6.6kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-371", rating: "ACB / 1600 A / 3P"]
mctB1 = ct [label: "TA-775", rating: "3 CTs / 1600/5 A"]
mpmB1 = watthour_meter [label: "PM-1091", rating: "kW / kWh"]
tie = bus_tie [label: "CB-380", rating: "630 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-325", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-750", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
f1pnl = hub [label: "FD-982", rating: "3P+N"]
f1l1ld = load [label: "PNL-1495", rating: "FORECOURT LIGHTING / 18 kW"]
f1l2ld = load [label: "PNL-1418", rating: "CANOPY AUXILIARIES / 26 kW"]
f2cb = breaker [label: "CB-306", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-701", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1016", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1443", rating: "CANOPY AUXILIARIES / 20 kW"]

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
f1pnl -> f1l2ld
busB -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
