sld "GEN-0404 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-433", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1699", rating: "210 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-316", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-701", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
f1cb = breaker [label: "CB-378", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-723", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1090", rating: "kW / kWh"]
f1pnl = hub [label: "FD-945", rating: "3P+N"]
f1l1cb = breaker [label: "CB-321", rating: "MCCB / 63 A / 3P"]
f1l1drv = vfd [label: "DRV-820", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1196", rating: "32 kW / PROC"]
f1l2ld = load [label: "PNL-1402", rating: "SHOP AUXILIARIES / 50 kW"]

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
f1pnl -> f1l2ld
mctA1 -> mpmA1
f1ct -> f1pm
