sld "GEN-0806 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-488", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1651", rating: "110 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-385", rating: "ACB / 160 A / 3P"]
mctA1 = ct [label: "TA-784", rating: "3 CTs / 160/5 A"]
mpmA1 = watthour_meter [label: "PM-1017", rating: "kW / kWh"]
srcA2 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "150 kW"]
mcbA2 = breaker [label: "CB-305", rating: "ACB / 250 A / 3P"]
mctA2 = ct [label: "TA-708", rating: "3 CTs / 250/5 A"]
mpmA2 = watthour_meter [label: "PM-1007", rating: "kW / kWh"]
f1cb = breaker [label: "CB-345", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-728", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1018", rating: "kW / kWh"]
f1pnl = hub [label: "FD-978", rating: "3P+N"]
f1l1cb = breaker [label: "CB-314", rating: "MCCB / 16 A / 3P"]
f1l1drv = vfd [label: "DRV-861", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1122", rating: "7 kW / CRAC"]
f1l2cb = breaker [label: "CB-363", rating: "MCCB / 50 A / 3P"]
f1l2drv = vfd [label: "DRV-856", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1123", rating: "20 kW / CRAC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
