sld "GEN-0325 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-463", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1622", rating: "1660 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-325", rating: "MCCB / 2000 A / 3P"]
mctA1 = ct [label: "TA-734", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1041", rating: "kW / kWh"]
f1cb = breaker [label: "CB-357", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-746", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1046", rating: "kW / kWh"]
f1pnl = hub [label: "FD-993", rating: "3P+N"]
f1l1cb = breaker [label: "CB-361", rating: "MCCB / 63 A / 3P"]
f1l1drv = vfd [label: "DRV-808", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1183", rating: "36 kW / AHU"]
f1l2cb = breaker [label: "CB-386", rating: "MCCB / 32 A / 3P"]
f1l2drv = vfd [label: "DRV-836", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1164", rating: "15 kW / AHU"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
mctA1 -> mpmA1
f1ct -> f1pm
