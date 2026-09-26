sld "GEN-0552 — RETAIL FACILITY / ELECTRICAL DISTRIBUTION"
# STORE SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-432", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1666", rating: "440 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-392", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-700", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1004", rating: "kW / kWh"]
f1cb = breaker [label: "CB-322", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-790", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1096", rating: "kW / kWh"]
f1pnl = hub [label: "FD-900", rating: "3P+N"]
f1l1cb = breaker [label: "CB-337", rating: "MCCB / 32 A / 3P"]
f1l1m = motor [label: "MTR-1163", rating: "15 kW / EF"]
f1l2cb = breaker [label: "CB-349", rating: "MCCB / 32 A / 3P"]
f1l2drv = vfd [label: "DRV-878", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1197", rating: "14 kW / AHU"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
mctA1 -> mpmA1
f1ct -> f1pm
