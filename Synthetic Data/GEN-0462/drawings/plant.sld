sld "GEN-0462 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-453", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1659", rating: "360 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-307", rating: "MCCB / 1000 A / 3P"]
mctA1 = ct [label: "TA-793", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1063", rating: "kW / kWh"]
f1cb = breaker [label: "CB-389", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-739", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1050", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-300", rating: "MCCB / 160 A / 3P"]
f1l1drv = vfd [label: "DRV-800", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1199", rating: "40 kW / RWP"]
f2cb = breaker [label: "CB-355", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-764", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1025", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1473", rating: "DOSING PANEL / 29 kW"]
f3cb = breaker [label: "CB-354", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-722", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1054", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1489", rating: "DOSING PANEL / 38 kW"]

srcA1 -> txA1
txA1 -> mcbA1
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
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
