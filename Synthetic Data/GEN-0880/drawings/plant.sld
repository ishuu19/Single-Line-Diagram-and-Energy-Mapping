sld "GEN-0880 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-405", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1668", rating: "440 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-300", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-752", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1058", rating: "kW / kWh"]
f1cb = breaker [label: "CB-348", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-784", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1063", rating: "kW / kWh"]
f1pnl = hub [label: "FD-959", rating: "3P+N"]
f1l1cb = breaker [label: "CB-301", rating: "MCCB / 25 A / 3P"]
f1l1drv = vfd [label: "DRV-852", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1115", rating: "12 kW / CRAC"]
f1l2cb = breaker [label: "CB-377", rating: "MCCB / 25 A / 3P"]
f1l2drv = vfd [label: "DRV-868", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1154", rating: "10 kW / CRAC"]
f2cb = breaker [label: "CB-391", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-761", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f2pnl = hub [label: "FD-980", rating: "3P+N"]
f2l1ld = load [label: "PNL-1449", rating: "RECTIFIER PDU / 33 kW"]
f2l2ld = load [label: "PNL-1498", rating: "RECTIFIER PDU / 26 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
