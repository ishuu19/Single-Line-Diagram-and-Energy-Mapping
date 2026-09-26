sld "GEN-0056 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-466", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
mcbA1 = breaker [label: "CB-334", rating: "MCCB / 2000 A / 3P"]
mctA1 = ct [label: "TA-713", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1091", rating: "kW / kWh"]
f1cb = breaker [label: "CB-373", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-700", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-352", rating: "MCCB / 160 A / 3P"]
f1l1drv = vfd [label: "DRV-888", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1164", rating: "35 kW / CRAC"]
f2cb = breaker [label: "CB-301", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-750", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1489", rating: "FLOOR LIGHTING / 64 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
