sld "GEN-0018 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-410", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1661", rating: "1330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-305", rating: "MCCB / 1600 A / 3P"]
mctA1 = ct [label: "TA-731", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
f1cb = breaker [label: "CB-370", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-798", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1038", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1457", rating: "SHOP LIGHTING / 12 kW"]
f2cb = breaker [label: "CB-374", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-707", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1062", rating: "kW / kWh"]
f2pnl = hub [label: "FD-922", rating: "3P+N"]
f2l1cb = breaker [label: "CB-342", rating: "MCCB / 32 A / 3P"]
f2l1drv = vfd [label: "DRV-821", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1144", rating: "16 kW / PROC"]
f2l2ld = load [label: "PNL-1414", rating: "SHOP LIGHTING / 16 kW"]
f3cb = breaker [label: "CB-365", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-772", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1057", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1461", rating: "PRESS FLOOR PANEL / 18 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
