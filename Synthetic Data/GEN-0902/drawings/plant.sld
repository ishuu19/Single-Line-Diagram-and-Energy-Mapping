sld "GEN-0902 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-418", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1645", rating: "1110 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-324", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-735", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1072", rating: "kW / kWh"]
f1cb = breaker [label: "CB-308", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-734", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1057", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-363", rating: "MCCB / 40 A / 3P"]
f1l1m = motor [label: "MTR-1146", rating: "17 kW / COND"]
f2cb = breaker [label: "CB-328", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-711", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1053", rating: "kW / kWh"]
f2pnl = hub [label: "FD-954", rating: "3P+N"]
f2l1ld = load [label: "PNL-1459", rating: "CELLAR PANEL / 11 kW"]
f2l2cb = breaker [label: "CB-397", rating: "MCCB / 63 A / 3P"]
f2l2m = motor [label: "MTR-1111", rating: "28 kW / COND"]
f3cb = breaker [label: "CB-348", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-738", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
f3pnl = hub [label: "FD-961", rating: "3P+N"]
f3l1cb = breaker [label: "CB-382", rating: "MCCB / 40 A / 3P"]
f3l1m = motor [label: "MTR-1104", rating: "16 kW / COND"]
f3l2ld = load [label: "PNL-1443", rating: "CELLAR PANEL / 19 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2cb
f2l2cb -> f2l2m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1cb
f3l1cb -> f3l1m
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
