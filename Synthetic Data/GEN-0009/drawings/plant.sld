sld "GEN-0009 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-475", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1616", rating: "140 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-310", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-743", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1038", rating: "kW / kWh"]
f1cb = breaker [label: "CB-378", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-725", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1036", rating: "kW / kWh"]
f1pnl = hub [label: "FD-997", rating: "3P+N"]
f1l1ld = load [label: "PNL-1405", rating: "AUXILIARY PANEL / 23 kW"]
f1l2ld = load [label: "PNL-1462", rating: "DOSING PANEL / 24 kW"]
f2cb = breaker [label: "CB-327", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-708", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f2pnl = hub [label: "FD-988", rating: "3P+N"]
f2l1ld = load [label: "PNL-1478", rating: "DOSING PANEL / 38 kW"]
f2l2ld = load [label: "PNL-1450", rating: "AUXILIARY PANEL / 68 kW"]
f3cb = breaker [label: "CB-365", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-730", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-302", rating: "MCCB / 200 A / 3P"]
f3l1drv = vfd [label: "DRV-854", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1193", rating: "43 kW / BLOW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#1/0 AWG"]
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
