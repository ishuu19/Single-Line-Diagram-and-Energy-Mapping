sld "GEN-0234 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-427", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1655", rating: "140 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-327", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-707", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
f1cb = breaker [label: "CB-321", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-785", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1033", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1460", rating: "SHOP AUXILIARIES / 43 kW"]
f2cb = breaker [label: "CB-300", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-784", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
f2pnl = hub [label: "FD-986", rating: "3P+N"]
f2l1ld = load [label: "PNL-1420", rating: "SHOP LIGHTING / 20 kW"]
f2l2cb = breaker [label: "CB-374", rating: "MCCB / 100 A / 3P"]
f2l2m = motor [label: "MTR-1133", rating: "24 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2cb
f2l2cb -> f2l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
