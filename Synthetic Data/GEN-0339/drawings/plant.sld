sld "GEN-0339 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-455", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1638", rating: "360 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-394", rating: "MCCB / 1000 A / 3P"]
mctA1 = ct [label: "TA-741", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1048", rating: "kW / kWh"]
f1cb = breaker [label: "CB-387", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-753", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1041", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1494", rating: "CELLAR PANEL / 14 kW"]
f2cb = breaker [label: "CB-379", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-754", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1036", rating: "kW / kWh"]
f2pnl = hub [label: "FD-913", rating: "3P+N"]
f2l1cb = breaker [label: "CB-361", rating: "MCCB / 125 A / 3P"]
f2l1drv = vfd [label: "DRV-888", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1121", rating: "29 kW / PROC"]
f2l2cb = breaker [label: "CB-396", rating: "MCCB / 100 A / 3P"]
f2l2m = motor [label: "MTR-1156", rating: "25 kW / COMP"]
f3cb = breaker [label: "CB-305", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-746", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-330", rating: "MCCB / 80 A / 3P"]
f3l1m = motor [label: "MTR-1162", rating: "19 kW / COND"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
f2pnl -> f2l2cb
f2l2cb -> f2l2m
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
