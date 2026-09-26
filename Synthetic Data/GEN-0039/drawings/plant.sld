sld "GEN-0039 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-449", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1657", rating: "170 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-384", rating: "MCCB / 250 A / 3P"]
mctA1 = ct [label: "TA-743", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1091", rating: "kW / kWh"]
f1cb = breaker [label: "CB-378", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-786", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
f1pnl = hub [label: "FD-993", rating: "3P+N"]
f1l1ld = load [label: "PNL-1419", rating: "SHELTER LIGHTING / 6 kW"]
f1l2cb = breaker [label: "CB-353", rating: "MCCB / 50 A / 3P"]
f1l2drv = vfd [label: "DRV-828", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1160", rating: "21 kW / CRAC"]

srcA1 -> txA1
txA1 -> mcbA1
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
