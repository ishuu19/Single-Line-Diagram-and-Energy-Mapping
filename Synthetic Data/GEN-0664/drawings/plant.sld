sld "GEN-0664 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-423", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1690", rating: "690 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-315", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-726", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
f1cb = breaker [label: "CB-334", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-728", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1042", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-355", rating: "MCCB / 25 A / 3P"]
f1l1m = motor [label: "MTR-1159", rating: "12 kW / EF"]
f2cb = breaker [label: "CB-370", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-719", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1481", rating: "DOCK PANEL / 30 kW"]
f3cb = breaker [label: "CB-390", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-716", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1021", rating: "kW / kWh"]
f3pnl = hub [label: "FD-909", rating: "3P+N"]
f3l1cb = breaker [label: "CB-312", rating: "MCCB / 63 A / 3P"]
f3l1m = motor [label: "MTR-1115", rating: "26 kW / COND"]
f3l2ld = load [label: "PNL-1424", rating: "DOCK PANEL / 28 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1cb
f3l1cb -> f3l1m
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
