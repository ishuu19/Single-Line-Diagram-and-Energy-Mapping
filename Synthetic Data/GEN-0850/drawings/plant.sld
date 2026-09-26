sld "GEN-0850 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-497", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1632", rating: "210 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-367", rating: "MCCB / 250 A / 3P"]
mctA1 = ct [label: "TA-721", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
f1cb = breaker [label: "CB-316", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-793", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1094", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-356", rating: "MCCB / 25 A / 3P"]
f1l1drv = vfd [label: "DRV-815", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1153", rating: "13 kW / CRAC"]

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
