sld "GEN-0652 — RETAIL FACILITY / ELECTRICAL DISTRIBUTION"
# STORE SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-467", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1698", rating: "690 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-380", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-713", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1056", rating: "kW / kWh"]
f1cb = breaker [label: "CB-313", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-789", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1017", rating: "kW / kWh"]
f1pnl = hub [label: "FD-986", rating: "3P+N"]
f1l1cb = breaker [label: "CB-399", rating: "MCCB / 32 A / 3P"]
f1l1drv = vfd [label: "DRV-804", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1133", rating: "15 kW / AHU"]
f1l2cb = breaker [label: "CB-344", rating: "MCCB / 32 A / 3P"]
f1l2drv = vfd [label: "DRV-876", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1110", rating: "13 kW / AHU"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
mctA1 -> mpmA1
f1ct -> f1pm
