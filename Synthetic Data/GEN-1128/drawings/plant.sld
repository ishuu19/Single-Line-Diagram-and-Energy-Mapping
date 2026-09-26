sld "GEN-1128 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-480", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1656", rating: "1390 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-350", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-778", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1099", rating: "kW / kWh"]
busB = bus [label: "BUS-410", voltage: "400Y/230V"]
srcB1 = utility [label: "11kV SUPPLY B", voltage: "11kV"]
txB1 = transformer_yd [label: "TX-1686", rating: "1110 kVA", voltage: "11kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-320", rating: "ACB / 1600 A / 3P"]
mctB1 = ct [label: "TA-772", rating: "3 CTs / 1600/5 A"]
mpmB1 = watthour_meter [label: "PM-1091", rating: "kW / kWh"]
tie = bus_tie [label: "CB-334", rating: "800 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-361", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-762", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1069", rating: "kW / kWh"]
f1pnl = hub [label: "FD-908", rating: "3P+N"]
f1l1ld = load [label: "PNL-1444", rating: "AUXILIARY PANEL / 33 kW"]
f1l2cb = breaker [label: "CB-335", rating: "MCCB / 16 A / 3P"]
f1l2m = motor [label: "MTR-1130", rating: "5 kW / EF"]
f2cb = breaker [label: "CB-351", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-781", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-314", rating: "MCCB / 25 A / 3P"]
f2l1m = motor [label: "MTR-1189", rating: "12 kW / EF"]

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
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2m
busB -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
