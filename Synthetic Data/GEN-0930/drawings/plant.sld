sld "GEN-0930 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-484", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
mcbA1 = breaker [label: "CB-374", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-736", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1029", rating: "kW / kWh"]
f1cb = breaker [label: "CB-326", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-756", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f1pnl = hub [label: "FD-941", rating: "3P+N"]
f1l1cb = breaker [label: "CB-392", rating: "MCCB / 50 A / 3P"]
f1l1drv = vfd [label: "DRV-856", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1113", rating: "22 kW / CRAC"]
f1l2ld = load [label: "PNL-1432", rating: "SHELTER LIGHTING / 11 kW"]
f2cb = breaker [label: "CB-303", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-795", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
f2pnl = hub [label: "FD-930", rating: "3P+N"]
f2l1ld = load [label: "PNL-1405", rating: "RECTIFIER PDU / 20 kW"]
f2l2ld = load [label: "PNL-1400", rating: "RECTIFIER PDU / 35 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
