sld "GEN-1459 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-489", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1653", rating: "280 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-395", rating: "MCCB / 400 A / 3P"]
mctA1 = ct [label: "TA-723", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1004", rating: "kW / kWh"]
f1cb = breaker [label: "CB-326", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-720", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1033", rating: "kW / kWh"]
f1pnl = hub [label: "FD-945", rating: "3P+N"]
f1l1cb = breaker [label: "CB-376", rating: "MCCB / 25 A / 3P"]
f1l1m = motor [label: "MTR-1188", rating: "11 kW / EF"]
f1l2ld = load [label: "PNL-1412", rating: "COMMON AREA LIGHTING / 27 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2ld
mctA1 -> mpmA1
f1ct -> f1pm
