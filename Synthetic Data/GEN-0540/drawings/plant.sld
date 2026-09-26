sld "GEN-0540 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-485", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1611", rating: "1330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-342", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-762", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 377 kW", voltage: "480Y/277V"]
mcbA2 = breaker [label: "CB-352", rating: "MCCB / 400 A / 3P"]
mctA2 = ct [label: "TA-723", rating: "3 CTs / 400/5 A"]
mpmA2 = watthour_meter [label: "PM-1096", rating: "kW / kWh"]
f1cb = breaker [label: "CB-366", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-734", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f1pnl = hub [label: "FD-996", rating: "3P+N"]
f1l1cb = breaker [label: "CB-360", rating: "MCCB / 50 A / 3P"]
f1l1drv = vfd [label: "DRV-809", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1195", rating: "25 kW / AHU"]
f1l2cb = breaker [label: "CB-378", rating: "MCCB / 32 A / 3P"]
f1l2m = motor [label: "MTR-1164", rating: "15 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
