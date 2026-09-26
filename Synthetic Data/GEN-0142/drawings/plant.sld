sld "GEN-0142 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-445", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1687", rating: "1110 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-306", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-718", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1091", rating: "kW / kWh"]
busB = bus [label: "BUS-423", voltage: "400Y/230V"]
srcB1 = utility [label: "6.6kV SUPPLY B", voltage: "6.6kV"]
txB1 = transformer_dy [label: "TX-1696", rating: "1390 kVA", voltage: "6.6kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-389", rating: "ACB / 2000 A / 3P"]
mctB1 = ct [label: "TA-702", rating: "3 CTs / 2000/5 A"]
mpmB1 = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
tie = bus_tie [label: "CB-352", rating: "1000 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-332", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-770", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
f1pnl = hub [label: "FD-921", rating: "3P+N"]
f1l1ld = load [label: "PNL-1495", rating: "ACADEMIC BLOCK PANEL / 82 kW"]
f1l2ld = load [label: "PNL-1451", rating: "ACADEMIC BLOCK PANEL / 61 kW"]
f2cb = breaker [label: "CB-345", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-781", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1421", rating: "ACADEMIC BLOCK PANEL / 48 kW"]

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
f2ct -> f2l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
