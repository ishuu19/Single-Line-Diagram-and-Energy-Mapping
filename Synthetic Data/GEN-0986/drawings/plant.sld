sld "GEN-0986 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-421", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
mcbA1 = breaker [label: "CB-351", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-759", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1011", rating: "kW / kWh"]
f1cb = breaker [label: "CB-301", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-705", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1039", rating: "kW / kWh"]
f1pnl = hub [label: "FD-935", rating: "3P+N"]
f1l1ld = load [label: "PNL-1495", rating: "TENANT PANEL / 60 kW"]
f1l2cb = breaker [label: "CB-333", rating: "MCCB / 80 A / 3P"]
f1l2drv = vfd [label: "DRV-843", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1189", rating: "36 kW / CRAC"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
mctA1 -> mpmA1
f1ct -> f1pm
