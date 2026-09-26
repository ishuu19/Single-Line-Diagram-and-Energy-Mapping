sld "GEN-0374 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-480", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1696", rating: "280 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-319", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-744", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
f1cb = breaker [label: "CB-339", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-789", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
f1pnl = hub [label: "FD-997", rating: "3P+N"]
f1l1ld = load [label: "PNL-1426", rating: "TENANT PANEL / 107 kW"]
f1l2cb = breaker [label: "CB-315", rating: "MCCB / 20 A / 3P"]
f1l2m = motor [label: "MTR-1183", rating: "9 kW / EF"]

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
