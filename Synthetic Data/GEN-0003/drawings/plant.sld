sld "GEN-0003 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-424", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
mcbA1 = breaker [label: "CB-317", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-769", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1098", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 280 kW", voltage: "208Y/120V"]
mcbA2 = breaker [label: "CB-365", rating: "MCCB / 800 A / 3P"]
mctA2 = ct [label: "TA-774", rating: "3 CTs / 800/5 A"]
mpmA2 = watthour_meter [label: "PM-1003", rating: "kW / kWh"]
f1cb = breaker [label: "CB-331", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-776", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1053", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-362", rating: "MCCB / 100 A / 3P"]
f1l1drv = vfd [label: "DRV-807", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1172", rating: "25 kW / AHU"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
