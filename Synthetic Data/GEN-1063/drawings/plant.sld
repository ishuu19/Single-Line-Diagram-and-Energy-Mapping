sld "GEN-1063 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-451", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1630", rating: "670 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-325", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-794", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f1cb = breaker [label: "CB-359", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-780", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1041", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-303", rating: "MCCB / 40 A / 3P"]
f1l1m = motor [label: "MTR-1116", rating: "20 kW / COMP"]
f2cb = breaker [label: "CB-373", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-787", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
f2pnl = hub [label: "FD-940", rating: "3P+N"]
f2l1cb = breaker [label: "CB-368", rating: "MCCB / 50 A / 3P"]
f2l1m = motor [label: "MTR-1176", rating: "29 kW / COND"]
f2l2ld = load [label: "PNL-1443", rating: "CELLAR PANEL / 19 kW"]
f3cb = breaker [label: "CB-339", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-756", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1063", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-341", rating: "MCCB / 40 A / 3P"]
f3l1m = motor [label: "MTR-1146", rating: "21 kW / COND"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1m
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
