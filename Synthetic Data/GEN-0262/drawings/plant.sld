sld "GEN-0262 — RETAIL FACILITY / ELECTRICAL DISTRIBUTION"
# STORE SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-432", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1608", rating: "1110 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-317", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-785", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1049", rating: "kW / kWh"]
f1cb = breaker [label: "CB-341", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-709", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1011", rating: "kW / kWh"]
f1pnl = hub [label: "FD-975", rating: "3P+N"]
f1l1cb = breaker [label: "CB-355", rating: "MCCB / 63 A / 3P"]
f1l1drv = vfd [label: "DRV-882", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1101", rating: "29 kW / AHU"]
f1l2cb = breaker [label: "CB-334", rating: "MCCB / 20 A / 3P"]
f1l2m = motor [label: "MTR-1117", rating: "8 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2m
mctA1 -> mpmA1
f1ct -> f1pm
