sld "GEN-0884 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-496", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1631", rating: "690 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-349", rating: "MCCB / 1000 A / 3P"]
mctA1 = ct [label: "TA-733", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1091", rating: "kW / kWh"]
f1cb = breaker [label: "CB-336", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-703", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1066", rating: "kW / kWh"]
f1pnl = hub [label: "FD-933", rating: "3P+N"]
f1l1ld = load [label: "PNL-1402", rating: "SHOP AUXILIARIES / 43 kW"]
f1l2ld = load [label: "PNL-1452", rating: "SHOP LIGHTING / 16 kW"]
f2cb = breaker [label: "CB-333", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-737", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
f2pnl = hub [label: "FD-908", rating: "3P+N"]
f2l1cb = breaker [label: "CB-348", rating: "MCCB / 125 A / 3P"]
f2l1drv = vfd [label: "DRV-877", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1177", rating: "57 kW / PROC"]
f2l2ld = load [label: "PNL-1448", rating: "SHOP LIGHTING / 29 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
