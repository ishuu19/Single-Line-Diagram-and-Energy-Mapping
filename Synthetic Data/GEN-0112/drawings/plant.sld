sld "GEN-0112 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-479", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1676", rating: "170 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-337", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-714", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1017", rating: "kW / kWh"]
f1cb = breaker [label: "CB-399", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-742", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1037", rating: "kW / kWh"]
f1pnl = hub [label: "FD-930", rating: "3P+N"]
f1l1ld = load [label: "PNL-1465", rating: "TENANT PANEL / 104 kW"]
f1l2cb = breaker [label: "CB-353", rating: "MCCB / 32 A / 3P"]
f1l2m = motor [label: "MTR-1167", rating: "14 kW / EF"]

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
