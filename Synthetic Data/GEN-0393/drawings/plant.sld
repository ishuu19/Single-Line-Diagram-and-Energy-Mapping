sld "GEN-0393 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-447", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1670", rating: "690 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-302", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-769", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1069", rating: "kW / kWh"]
f1cb = breaker [label: "CB-365", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-729", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1054", rating: "kW / kWh"]
f1pnl = hub [label: "FD-914", rating: "3P+N"]
f1l1ld = load [label: "PNL-1429", rating: "SHOP LIGHTING / 30 kW"]
f1l2ld = load [label: "PNL-1492", rating: "SHOP LIGHTING / 17 kW"]
f2cb = breaker [label: "CB-357", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-719", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
f2pnl = hub [label: "FD-942", rating: "3P+N"]
f2l1ld = load [label: "PNL-1482", rating: "SHOP LIGHTING / 22 kW"]
f2l2cb = breaker [label: "CB-368", rating: "MCCB / 63 A / 3P"]
f2l2m = motor [label: "MTR-1171", rating: "30 kW / COMP"]

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
f2pnl -> f2l1ld
f2pnl -> f2l2cb
f2l2cb -> f2l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
