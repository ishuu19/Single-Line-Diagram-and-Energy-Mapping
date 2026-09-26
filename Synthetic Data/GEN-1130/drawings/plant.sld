sld "GEN-1130 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-451", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
mcbA1 = breaker [label: "CB-304", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-739", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1049", rating: "kW / kWh"]
f1cb = breaker [label: "CB-370", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-772", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1015", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-341", rating: "MCCB / 100 A / 3P"]
f1l1drv = vfd [label: "DRV-893", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1184", rating: "25 kW / AHU"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
mctA1 -> mpmA1
f1ct -> f1pm
