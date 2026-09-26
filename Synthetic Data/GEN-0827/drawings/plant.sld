sld "GEN-0827 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-448", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
mcbA1 = breaker [label: "CB-334", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-794", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
f1cb = breaker [label: "CB-395", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-791", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1058", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-363", rating: "MCCB / 630 A / 3P"]
f1l1drv = vfd [label: "DRV-824", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1185", rating: "313 kW / MILL"]
f2cb = breaker [label: "CB-318", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-795", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1039", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-365", rating: "MCCB / 1000 A / 3P"]
f2l1drv = vfd [label: "DRV-819", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1147", rating: "594 kW / MILL"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
