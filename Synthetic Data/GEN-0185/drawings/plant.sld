sld "GEN-0185 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-472", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1608", rating: "1390 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-362", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-713", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
f1cb = breaker [label: "CB-327", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-729", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1076", rating: "kW / kWh"]
f1pnl = hub [label: "FD-916", rating: "3P+N"]
f1l1cb = breaker [label: "CB-382", rating: "MCCB / 25 A / 3P"]
f1l1m = motor [label: "MTR-1172", rating: "10 kW / EF"]
f1l2ld = load [label: "PNL-1492", rating: "CLASSROOM LIGHTING / 54 kW"]

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
