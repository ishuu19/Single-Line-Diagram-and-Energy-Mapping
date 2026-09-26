sld "GEN-0971 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-490", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
mcbA1 = breaker [label: "CB-331", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-721", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1081", rating: "kW / kWh"]
f1cb = breaker [label: "CB-378", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-766", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-380", rating: "MCCB / 63 A / 3P"]
f1l1drv = vfd [label: "DRV-827", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1102", rating: "37 kW / AHU"]

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
