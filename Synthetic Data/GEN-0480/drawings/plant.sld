sld "GEN-0480 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-457", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1606", rating: "360 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-332", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-782", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1090", rating: "kW / kWh"]
f1cb = breaker [label: "CB-387", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-798", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
f1pnl = hub [label: "FD-927", rating: "3P+N"]
f1l1cb = breaker [label: "CB-334", rating: "MCCB / 160 A / 3P"]
f1l1drv = vfd [label: "DRV-885", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1194", rating: "36 kW / PROC"]
f1l2cb = breaker [label: "CB-301", rating: "MCCB / 125 A / 3P"]
f1l2m = motor [label: "MTR-1183", rating: "28 kW / COMP"]
f2cb = breaker [label: "CB-353", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-712", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1046", rating: "kW / kWh"]
f2pnl = hub [label: "FD-918", rating: "3P+N"]
f2l1ld = load [label: "PNL-1406", rating: "UTILITY PANEL / 29 kW"]
f2l2cb = breaker [label: "CB-329", rating: "MCCB / 125 A / 3P"]
f2l2drv = vfd [label: "DRV-893", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1175", rating: "29 kW / PROC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2m
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2cb
f2l2cb -> f2l2drv
f2l2drv -> f2l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
