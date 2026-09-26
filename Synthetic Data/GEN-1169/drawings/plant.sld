sld "GEN-1169 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-471", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1606", rating: "330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-330", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-704", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1004", rating: "kW / kWh"]
f1cb = breaker [label: "CB-324", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-779", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
f1pnl = hub [label: "FD-916", rating: "3P+N"]
f1l1ld = load [label: "PNL-1406", rating: "CLASSROOM LIGHTING / 37 kW"]
f1l2cb = breaker [label: "CB-320", rating: "MCCB / 40 A / 3P"]
f1l2drv = vfd [label: "DRV-812", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1116", rating: "22 kW / AHU"]
f2cb = breaker [label: "CB-372", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-718", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1015", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-331", rating: "MCCB / 32 A / 3P"]
f2l1drv = vfd [label: "DRV-849", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1196", rating: "16 kW / AHU"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
