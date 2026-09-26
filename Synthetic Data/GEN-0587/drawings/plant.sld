sld "GEN-0587 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-472", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
mcbA1 = breaker [label: "CB-316", rating: "MCCB / 630 A / 3P"]
mctA1 = ct [label: "TA-702", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1020", rating: "kW / kWh"]
srcA2 = utility [label: "22kV STANDBY", voltage: "22kV"]
mcbA2 = breaker [label: "CB-367", rating: "MCCB / 1000 A / 3P"]
mctA2 = ct [label: "TA-773", rating: "3 CTs / 1000/5 A"]
mpmA2 = watthour_meter [label: "PM-1016", rating: "kW / kWh"]
f1cb = breaker [label: "CB-396", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-763", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1081", rating: "kW / kWh"]
f1pnl = hub [label: "FD-950", rating: "3P+N"]
f1l1ld = load [label: "PNL-1497", rating: "CONTROL PANEL / 12 kW"]
f1l2cb = breaker [label: "CB-301", rating: "MCCB / 25 A / 3P"]
f1l2drv = vfd [label: "DRV-812", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1193", rating: "12 kW / EF"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
