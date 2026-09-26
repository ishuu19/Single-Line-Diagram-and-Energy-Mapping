sld "GEN-0016 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-488", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1699", rating: "280 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-302", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-798", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1004", rating: "kW / kWh"]
f1cb = breaker [label: "CB-367", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-708", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1036", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-321", rating: "MCCB / 50 A / 3P"]
f1l1drv = vfd [label: "DRV-860", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1178", rating: "20 kW / CRAC"]
f2cb = breaker [label: "CB-381", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-792", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1046", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-353", rating: "MCCB / 50 A / 3P"]
f2l1drv = vfd [label: "DRV-875", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1199", rating: "21 kW / CRAC"]
f3cb = breaker [label: "CB-388", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-724", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1030", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-309", rating: "MCCB / 25 A / 3P"]
f3l1drv = vfd [label: "DRV-812", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1195", rating: "11 kW / CRAC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
