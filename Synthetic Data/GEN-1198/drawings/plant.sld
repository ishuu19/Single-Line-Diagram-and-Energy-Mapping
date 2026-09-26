sld "GEN-1198 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-481", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1608", rating: "550 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-372", rating: "MCCB / 800 A / 3P"]
mctA1 = ct [label: "TA-789", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1068", rating: "kW / kWh"]
f1cb = breaker [label: "CB-380", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-783", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1073", rating: "kW / kWh"]
f1pnl = hub [label: "FD-965", rating: "3P+N"]
f1l1ld = load [label: "PNL-1498", rating: "AUXILIARY PANEL / 11 kW"]
f1l2ld = load [label: "PNL-1453", rating: "RISER PANEL / 87 kW"]
f2cb = breaker [label: "CB-384", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-718", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1078", rating: "kW / kWh"]
f2pnl = hub [label: "FD-945", rating: "3P+N"]
f2l1ld = load [label: "PNL-1413", rating: "COMMON AREA LIGHTING / 52 kW"]
f2l2ld = load [label: "PNL-1434", rating: "AUXILIARY PANEL / 28 kW"]
f3cb = breaker [label: "CB-389", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-794", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-368", rating: "MCCB / 63 A / 3P"]
f3l1drv = vfd [label: "DRV-830", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1111", rating: "28 kW / CRAC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
