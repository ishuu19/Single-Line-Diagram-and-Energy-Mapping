sld "GEN-1522 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-471", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1662", rating: "1390 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-381", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-768", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1046", rating: "kW / kWh"]
f1cb = breaker [label: "CB-325", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-753", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1078", rating: "kW / kWh"]
f1pnl = hub [label: "FD-952", rating: "3P+N"]
f1l1ld = load [label: "PNL-1400", rating: "ADMIN PANEL / 62 kW"]
f1l2cb = breaker [label: "CB-333", rating: "MCCB / 25 A / 3P"]
f1l2m = motor [label: "MTR-1189", rating: "10 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2m
mctA1 -> mpmA1
f1ct -> f1pm
