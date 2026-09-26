sld "GEN-1180 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-406", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
mcbA1 = breaker [label: "CB-303", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-745", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1033", rating: "kW / kWh"]
f1cb = breaker [label: "CB-397", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-798", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f1pnl = hub [label: "FD-941", rating: "3P+N"]
f1l1cb = breaker [label: "CB-355", rating: "MCCB / 20 A / 3P"]
f1l1m = motor [label: "MTR-1162", rating: "9 kW / EF"]
f1l2cb = breaker [label: "CB-343", rating: "MCCB / 20 A / 3P"]
f1l2m = motor [label: "MTR-1184", rating: "8 kW / EF"]
f2cb = breaker [label: "CB-356", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-796", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1087", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1427", rating: "COMMON AREA LIGHTING / 22 kW"]
f3cb = breaker [label: "CB-392", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-727", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1410", rating: "RISER PANEL / 48 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
