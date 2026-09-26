sld "GEN-0731 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-414", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1626", rating: "440 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-361", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-774", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1026", rating: "kW / kWh"]
f1cb = breaker [label: "CB-370", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-713", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1046", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-330", rating: "MCCB / 25 A / 3P"]
f1l1drv = vfd [label: "DRV-887", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1164", rating: "12 kW / CRAC"]

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
