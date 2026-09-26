sld "GEN-0976 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-479", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1607", rating: "170 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-344", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-735", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
f1cb = breaker [label: "CB-377", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-797", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1033", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-395", rating: "MCCB / 200 A / 3P"]
f1l1drv = vfd [label: "DRV-839", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1162", rating: "84 kW / PROC"]
f2cb = breaker [label: "CB-372", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-768", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1020", rating: "kW / kWh"]
f2pnl = hub [label: "FD-991", rating: "3P+N"]
f2l1cb = breaker [label: "CB-371", rating: "MCCB / 50 A / 3P"]
f2l1m = motor [label: "MTR-1139", rating: "24 kW / COMP"]
f2l2cb = breaker [label: "CB-330", rating: "MCCB / 125 A / 3P"]
f2l2m = motor [label: "MTR-1130", rating: "50 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1m
f2pnl -> f2l2cb
f2l2cb -> f2l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
