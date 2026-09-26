sld "GEN-0159 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-479", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1695", rating: "170 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-321", rating: "MCCB / 250 A / 3P"]
mctA1 = ct [label: "TA-721", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1003", rating: "kW / kWh"]
f1cb = breaker [label: "CB-391", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-762", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1033", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1425", rating: "SHOP AUXILIARIES / 43 kW"]
f2cb = breaker [label: "CB-347", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-751", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1049", rating: "kW / kWh"]
f2pnl = hub [label: "FD-929", rating: "3P+N"]
f2l1ld = load [label: "PNL-1463", rating: "SHOP AUXILIARIES / 47 kW"]
f2l2cb = breaker [label: "CB-380", rating: "MCCB / 63 A / 3P"]
f2l2m = motor [label: "MTR-1115", rating: "31 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2cb
f2l2cb -> f2l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
