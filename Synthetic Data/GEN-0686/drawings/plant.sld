sld "GEN-0686 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-422", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1680", rating: "230 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-358", rating: "MCCB / 630 A / 3P"]
mctA1 = ct [label: "TA-786", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1021", rating: "kW / kWh"]
f1cb = breaker [label: "CB-359", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-734", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1060", rating: "kW / kWh"]
f1pnl = hub [label: "FD-938", rating: "3P+N"]
f1l1cb = breaker [label: "CB-351", rating: "MCCB / 80 A / 3P"]
f1l1drv = vfd [label: "DRV-816", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1125", rating: "19 kW / CRAC"]
f1l2ld = load [label: "PNL-1440", rating: "RECTIFIER PDU / 20 kW"]
f2cb = breaker [label: "CB-396", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-729", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1434", rating: "SHELTER LIGHTING / 10 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
