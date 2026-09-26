sld "GEN-1441 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-486", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1644", rating: "170 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-330", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-706", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1018", rating: "kW / kWh"]
f1cb = breaker [label: "CB-391", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-799", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1025", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-390", rating: "MCCB / 40 A / 3P"]
f1l1drv = vfd [label: "DRV-866", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1156", rating: "17 kW / CRAC"]
f2cb = breaker [label: "CB-366", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-728", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1451", rating: "SHELTER LIGHTING / 7 kW"]

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
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
