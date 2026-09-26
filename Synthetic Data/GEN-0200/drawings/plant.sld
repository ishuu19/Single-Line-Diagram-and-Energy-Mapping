sld "GEN-0200 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-416", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
mcbA1 = breaker [label: "CB-340", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-723", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1063", rating: "kW / kWh"]
f1cb = breaker [label: "CB-366", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-780", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1048", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-322", rating: "MCCB / 50 A / 3P"]
f1l1drv = vfd [label: "DRV-811", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1168", rating: "21 kW / CRAC"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
mctA1 -> mpmA1
f1ct -> f1pm
