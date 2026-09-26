sld "GEN-0743 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-434", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
mcbA1 = breaker [label: "CB-368", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-745", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1026", rating: "kW / kWh"]
f1cb = breaker [label: "CB-320", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-701", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1094", rating: "kW / kWh"]
f1pnl = hub [label: "FD-916", rating: "3P+N"]
f1l1ld = load [label: "PNL-1441", rating: "PRESS FLOOR PANEL / 20 kW"]
f1l2cb = breaker [label: "CB-383", rating: "MCCB / 50 A / 3P"]
f1l2drv = vfd [label: "DRV-838", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1146", rating: "27 kW / PROC"]
f2cb = breaker [label: "CB-386", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-770", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1054", rating: "kW / kWh"]
f2pnl = hub [label: "FD-931", rating: "3P+N"]
f2l1ld = load [label: "PNL-1469", rating: "PRESS FLOOR PANEL / 27 kW"]
f2l2cb = breaker [label: "CB-348", rating: "MCCB / 63 A / 3P"]
f2l2drv = vfd [label: "DRV-864", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1166", rating: "32 kW / PROC"]
f3cb = breaker [label: "CB-358", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-762", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1072", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1495", rating: "SHOP LIGHTING / 18 kW"]

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
f2pnl -> f2l2cb
f2l2cb -> f2l2drv
f2l2drv -> f2l2m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
