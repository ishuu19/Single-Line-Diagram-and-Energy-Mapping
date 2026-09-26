sld "GEN-1540 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-416", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1655", rating: "170 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-322", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-728", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1066", rating: "kW / kWh"]
f1cb = breaker [label: "CB-396", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-710", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
f1pnl = hub [label: "FD-915", rating: "3P+N"]
f1l1cb = breaker [label: "CB-381", rating: "MCCB / 20 A / 3P"]
f1l1drv = vfd [label: "DRV-849", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1144", rating: "9 kW / CRAC"]
f1l2ld = load [label: "PNL-1440", rating: "SHELTER LIGHTING / 10 kW"]

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
f1pnl -> f1l2ld
mctA1 -> mpmA1
f1ct -> f1pm
