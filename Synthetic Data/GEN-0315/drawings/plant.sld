sld "GEN-0315 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-484", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1667", rating: "1390 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-348", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-733", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
f1cb = breaker [label: "CB-301", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-762", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1099", rating: "kW / kWh"]
f1pnl = hub [label: "FD-965", rating: "3P+N"]
f1l1ld = load [label: "PNL-1425", rating: "AUXILIARY PANEL / 84 kW"]
f1l2ld = load [label: "PNL-1420", rating: "AUXILIARY PANEL / 40 kW"]
f1x = capacitor_bank [label: "CAP-658", rating: "72 kVAR"]
f2cb = breaker [label: "CB-377", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-782", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1056", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-349", rating: "MCCB / 100 A / 3P"]
f2l1drv = vfd [label: "DRV-858", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1136", rating: "46 kW / PROC"]
f3cb = breaker [label: "CB-381", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-702", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1058", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-390", rating: "MCCB / 160 A / 3P"]
f3l1drv = vfd [label: "DRV-804", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1197", rating: "76 kW / PROC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
f1pnl -> f1x
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
