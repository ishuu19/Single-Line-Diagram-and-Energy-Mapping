sld "GEN-1147 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-471", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1657", rating: "1390 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-320", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-715", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1014", rating: "kW / kWh"]
busB = bus [label: "BUS-474", voltage: "400Y/230V"]
srcB1 = utility [label: "33kV SUPPLY B", voltage: "33kV"]
txB1 = transformer_dy [label: "TX-1609", rating: "1390 kVA", voltage: "33kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-385", rating: "MCCB / 2000 A / 3P"]
mctB1 = ct [label: "TA-747", rating: "3 CTs / 2000/5 A"]
mpmB1 = watthour_meter [label: "PM-1039", rating: "kW / kWh"]
tie = bus_tie [label: "CB-355", rating: "630 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-374", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-749", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1072", rating: "kW / kWh"]
f1pnl = hub [label: "FD-922", rating: "3P+N"]
f1l1ld = load [label: "PNL-1475", rating: "DOSING PANEL / 25 kW"]
f1l2ld = load [label: "PNL-1441", rating: "AUXILIARY PANEL / 16 kW"]
f2cb = breaker [label: "CB-305", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-778", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1048", rating: "kW / kWh"]
f2pnl = hub [label: "FD-960", rating: "3P+N"]
f2l1ld = load [label: "PNL-1470", rating: "AUXILIARY PANEL / 26 kW"]
f2l2ld = load [label: "PNL-1489", rating: "AUXILIARY PANEL / 30 kW"]

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
busB -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
