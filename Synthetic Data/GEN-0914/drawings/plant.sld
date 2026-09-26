sld "GEN-0914 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-431", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1656", rating: "1110 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-398", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-793", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f1cb = breaker [label: "CB-319", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-743", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-338", rating: "MCCB / 40 A / 3P"]
f1l1m = motor [label: "MTR-1150", rating: "19 kW / COND"]
f2cb = breaker [label: "CB-333", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-706", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1033", rating: "kW / kWh"]
f2pnl = hub [label: "FD-946", rating: "3P+N"]
f2l1cb = breaker [label: "CB-362", rating: "MCCB / 63 A / 3P"]
f2l1m = motor [label: "MTR-1109", rating: "30 kW / COMP"]
f2l2cb = breaker [label: "CB-310", rating: "MCCB / 63 A / 3P"]
f2l2m = motor [label: "MTR-1120", rating: "26 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1m
f2pnl -> f2l2cb
f2l2cb -> f2l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
