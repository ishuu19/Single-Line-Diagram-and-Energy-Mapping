sld "GEN-0334 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-467", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1626", rating: "280 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-386", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-749", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1069", rating: "kW / kWh"]
busB = bus [label: "BUS-435", voltage: "400Y/230V"]
srcB1 = utility [label: "11kV SUPPLY B", voltage: "11kV"]
txB1 = transformer_yd [label: "TX-1630", rating: "170 kVA", voltage: "11kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-307", rating: "MCCB / 250 A / 3P"]
mctB1 = ct [label: "TA-767", rating: "3 CTs / 250/5 A"]
mpmB1 = watthour_meter [label: "PM-1072", rating: "kW / kWh"]
tie = bus_tie [label: "CB-372", rating: "800 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-354", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-795", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1024", rating: "kW / kWh"]
f1pnl = hub [label: "FD-900", rating: "3P+N"]
f1l1ld = load [label: "PNL-1486", rating: "UTILITY PANEL / 19 kW"]
f1l2ld = load [label: "PNL-1496", rating: "AUXILIARY PANEL / 16 kW"]
f2cb = breaker [label: "CB-339", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-704", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1007", rating: "kW / kWh"]
f2pnl = hub [label: "FD-977", rating: "3P+N"]
f2l1ld = load [label: "PNL-1401", rating: "AUXILIARY PANEL / 13 kW"]
f2l2ld = load [label: "PNL-1462", rating: "AUXILIARY PANEL / 8 kW"]

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
