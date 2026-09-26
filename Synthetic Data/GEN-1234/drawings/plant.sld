sld "GEN-1234 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-457", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
mcbA1 = breaker [label: "CB-340", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-763", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1000", rating: "kW / kWh"]
f1cb = breaker [label: "CB-355", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-724", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
f1pnl = hub [label: "FD-957", rating: "3P+N"]
f1l1cb = breaker [label: "CB-366", rating: "MCCB / 32 A / 3P"]
f1l1drv = vfd [label: "DRV-873", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1159", rating: "17 kW / PROC"]
f1l2ld = load [label: "PNL-1416", rating: "PRESS FLOOR PANEL / 23 kW"]
f2cb = breaker [label: "CB-318", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-746", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1073", rating: "kW / kWh"]
f2pnl = hub [label: "FD-985", rating: "3P+N"]
f2l1ld = load [label: "PNL-1425", rating: "PRESS FLOOR PANEL / 28 kW"]
f2l2ld = load [label: "PNL-1405", rating: "SHOP LIGHTING / 17 kW"]
f3cb = breaker [label: "CB-391", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-715", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1068", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-369", rating: "MCCB / 32 A / 3P"]
f3l1drv = vfd [label: "DRV-896", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1103", rating: "18 kW / PROC"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
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
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
