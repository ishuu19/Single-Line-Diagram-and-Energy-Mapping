sld "GEN-0734 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-403", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1679", rating: "440 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-366", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-760", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1025", rating: "kW / kWh"]
f1cb = breaker [label: "CB-319", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-733", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1021", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-307", rating: "MCCB / 80 A / 3P"]
f1l1m = motor [label: "MTR-1157", rating: "32 kW / COMP"]
f2cb = breaker [label: "CB-353", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-724", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1020", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1473", rating: "CELLAR PANEL / 20 kW"]
f3cb = breaker [label: "CB-390", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-728", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1011", rating: "kW / kWh"]
f3pnl = hub [label: "FD-954", rating: "3P+N"]
f3l1cb = breaker [label: "CB-334", rating: "MCCB / 50 A / 3P"]
f3l1m = motor [label: "MTR-1152", rating: "23 kW / COMP"]
f3l2cb = breaker [label: "CB-331", rating: "MCCB / 63 A / 3P"]
f3l2m = motor [label: "MTR-1153", rating: "30 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1cb
f3l1cb -> f3l1m
f3pnl -> f3l2cb
f3l2cb -> f3l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
