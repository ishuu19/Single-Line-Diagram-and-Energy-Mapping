sld "GEN-0343 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-446", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1636", rating: "690 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-380", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-706", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1007", rating: "kW / kWh"]
f1cb = breaker [label: "CB-372", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-769", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
f1pnl = hub [label: "FD-951", rating: "3P+N"]
f1l1cb = breaker [label: "CB-390", rating: "MCCB / 50 A / 3P"]
f1l1m = motor [label: "MTR-1176", rating: "21 kW / EF"]
f1l2cb = breaker [label: "CB-348", rating: "MCCB / 25 A / 3P"]
f1l2m = motor [label: "MTR-1144", rating: "11 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2m
mctA1 -> mpmA1
f1ct -> f1pm
