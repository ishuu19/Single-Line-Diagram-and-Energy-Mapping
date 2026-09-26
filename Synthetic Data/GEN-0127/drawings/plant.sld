sld "GEN-0127 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-492", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1668", rating: "290 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-352", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-768", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1098", rating: "kW / kWh"]
f1cb = breaker [label: "CB-372", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-750", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f1pnl = hub [label: "FD-919", rating: "3P+N"]
f1l1ld = load [label: "PNL-1404", rating: "ADMIN PANEL / 38 kW"]
f1l2cb = breaker [label: "CB-303", rating: "MCCB / 100 A / 3P"]
f1l2drv = vfd [label: "DRV-858", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1175", rating: "24 kW / AHU"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
mctA1 -> mpmA1
f1ct -> f1pm
