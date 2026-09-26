sld "GEN-0118 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-449", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
mcbA1 = breaker [label: "CB-311", rating: "ACB / 160 A / 3P"]
mctA1 = ct [label: "TA-796", rating: "3 CTs / 160/5 A"]
mpmA1 = watthour_meter [label: "PM-1077", rating: "kW / kWh"]
f1cb = breaker [label: "CB-305", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-737", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1040", rating: "kW / kWh"]
f1pnl = hub [label: "FD-945", rating: "3P+N"]
f1l1ld = load [label: "PNL-1433", rating: "SHELTER LIGHTING / 5 kW"]
f1l2cb = breaker [label: "CB-370", rating: "MCCB / 32 A / 3P"]
f1l2drv = vfd [label: "DRV-832", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1145", rating: "18 kW / CRAC"]
f2cb = breaker [label: "CB-380", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-783", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1039", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1407", rating: "RECTIFIER PDU / 37 kW"]
f3cb = breaker [label: "CB-349", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-791", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1068", rating: "kW / kWh"]
f3pnl = hub [label: "FD-930", rating: "3P+N"]
f3l1ld = load [label: "PNL-1485", rating: "RECTIFIER PDU / 28 kW"]
f3l2ld = load [label: "PNL-1448", rating: "SHELTER LIGHTING / 5 kW"]

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
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
