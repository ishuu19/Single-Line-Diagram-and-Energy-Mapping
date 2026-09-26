sld "GEN-1368 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-415", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1651", rating: "330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-384", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-713", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
f1cb = breaker [label: "CB-310", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-774", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1022", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-379", rating: "MCCB / 25 A / 3P"]
f1l1drv = vfd [label: "DRV-871", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1186", rating: "13 kW / CRAC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
mctA1 -> mpmA1
f1ct -> f1pm
