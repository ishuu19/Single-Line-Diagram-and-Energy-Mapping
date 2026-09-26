sld "GEN-0030 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-422", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1665", rating: "1330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-336", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-731", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1066", rating: "kW / kWh"]
f1cb = breaker [label: "CB-363", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-751", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1067", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1468", rating: "LIFE SAFETY BRANCH / 51 kW"]
f2cb = breaker [label: "CB-333", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-757", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1024", rating: "kW / kWh"]
f2pnl = hub [label: "FD-916", rating: "3P+N"]
f2l1ld = load [label: "PNL-1422", rating: "WARD LIGHTING / 29 kW"]
f2l2ld = load [label: "PNL-1457", rating: "WARD LIGHTING / 20 kW"]
f3cb = breaker [label: "CB-337", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-798", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-314", rating: "MCCB / 63 A / 3P"]
f3l1drv = vfd [label: "DRV-837", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1175", rating: "37 kW / AHU"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
