sld "GEN-0290 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-478", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
mcbA1 = breaker [label: "CB-377", rating: "MCCB / 400 A / 3P"]
mctA1 = ct [label: "TA-723", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
f1cb = breaker [label: "CB-379", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-766", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1026", rating: "kW / kWh"]
f1pnl = hub [label: "FD-930", rating: "3P+N"]
f1l1ld = load [label: "PNL-1464", rating: "LIFE SAFETY BRANCH / 45 kW"]
f1l2cb = breaker [label: "CB-387", rating: "MCCB / 100 A / 3P"]
f1l2drv = vfd [label: "DRV-896", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1133", rating: "21 kW / AHU"]
f2cb = breaker [label: "CB-314", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-714", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1031", rating: "kW / kWh"]
f2pnl = hub [label: "FD-997", rating: "3P+N"]
f2l1ld = load [label: "PNL-1460", rating: "CRITICAL BRANCH / 71 kW"]
f2l2ld = load [label: "PNL-1487", rating: "LIFE SAFETY BRANCH / 25 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
