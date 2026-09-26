sld "GEN-0005 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-470", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1620", rating: "230 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-346", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-796", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1057", rating: "kW / kWh"]
f1cb = breaker [label: "CB-344", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-789", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-311", rating: "MCCB / 63 A / 3P"]
f1l1m = motor [label: "MTR-1113", rating: "16 kW / COMP"]
f2cb = breaker [label: "CB-334", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-743", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1041", rating: "kW / kWh"]
f2pnl = hub [label: "FD-998", rating: "3P+N"]
f2l1ld = load [label: "PNL-1471", rating: "CELLAR PANEL / 12 kW"]
f2l2ld = load [label: "PNL-1451", rating: "AUXILIARY PANEL / 45 kW"]
f3cb = breaker [label: "CB-315", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-718", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
f3pnl = hub [label: "FD-983", rating: "3P+N"]
f3l1cb = breaker [label: "CB-339", rating: "MCCB / 100 A / 3P"]
f3l1drv = vfd [label: "DRV-807", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1151", rating: "25 kW / PROC"]
f3l2ld = load [label: "PNL-1477", rating: "CELLAR PANEL / 19 kW"]

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
f2pnl -> f2l1ld
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
