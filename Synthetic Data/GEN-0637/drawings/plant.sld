sld "GEN-0637 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-433", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
mcbA1 = breaker [label: "CB-373", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-712", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1034", rating: "kW / kWh"]
f1cb = breaker [label: "CB-350", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-752", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1036", rating: "kW / kWh"]
f1pnl = hub [label: "FD-926", rating: "3P+N"]
f1l1ld = load [label: "PNL-1473", rating: "WARD LIGHTING / 33 kW"]
f1l2ld = load [label: "PNL-1485", rating: "WARD LIGHTING / 45 kW"]
f2cb = breaker [label: "CB-378", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-763", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1003", rating: "kW / kWh"]
f2pnl = hub [label: "FD-961", rating: "3P+N"]
f2l1ld = load [label: "PNL-1462", rating: "CRITICAL BRANCH / 58 kW"]
f2l2ld = load [label: "PNL-1418", rating: "LIFE SAFETY BRANCH / 42 kW"]
f3cb = breaker [label: "CB-318", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-765", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-317", rating: "MCCB / 32 A / 3P"]
f3l1drv = vfd [label: "DRV-859", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1139", rating: "15 kW / AHU"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
