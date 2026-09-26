sld "GEN-0659 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-480", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1686", rating: "580 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-309", rating: "MCCB / 1600 A / 3P"]
mctA1 = ct [label: "TA-726", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
f1cb = breaker [label: "CB-380", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-713", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1067", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1486", rating: "WARD LIGHTING / 37 kW"]
f2cb = breaker [label: "CB-371", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-734", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1088", rating: "kW / kWh"]
f2pnl = hub [label: "FD-947", rating: "3P+N"]
f2l1ld = load [label: "PNL-1405", rating: "CRITICAL BRANCH / 30 kW"]
f2l2ld = load [label: "PNL-1483", rating: "LIFE SAFETY BRANCH / 35 kW"]
f3cb = breaker [label: "CB-348", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-749", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1078", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-322", rating: "MCCB / 125 A / 3P"]
f3l1drv = vfd [label: "DRV-879", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1166", rating: "32 kW / AHU"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
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
