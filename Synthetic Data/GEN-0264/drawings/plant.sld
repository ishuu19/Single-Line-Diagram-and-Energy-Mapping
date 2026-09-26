sld "GEN-0264 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-432", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1631", rating: "60 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-382", rating: "MCCB / 160 A / 3P"]
mctA1 = ct [label: "TA-754", rating: "3 CTs / 160/5 A"]
mpmA1 = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
f1cb = breaker [label: "CB-319", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-722", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
f1pnl = hub [label: "FD-910", rating: "3P+N"]
f1l1ld = load [label: "PNL-1450", rating: "AUXILIARY PANEL / 11 kW"]
f1l2ld = load [label: "PNL-1418", rating: "AUXILIARY PANEL / 17 kW"]
f2cb = breaker [label: "CB-351", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-721", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1051", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1444", rating: "AUXILIARY PANEL / 22 kW"]
f3cb = breaker [label: "CB-386", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-713", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
f3pnl = hub [label: "FD-902", rating: "3P+N"]
f3l1ld = load [label: "PNL-1452", rating: "RECTIFIER PDU / 54 kW"]
f3l2cb = breaker [label: "CB-364", rating: "MCCB / 80 A / 3P"]
f3l2drv = vfd [label: "DRV-857", rating: "VFD / OL"]
f3l2m = motor [label: "MTR-1106", rating: "18 kW / CRAC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2cb
f3l2cb -> f3l2drv
f3l2drv -> f3l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
