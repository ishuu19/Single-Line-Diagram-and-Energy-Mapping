sld "GEN-0820 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-479", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
mcbA1 = breaker [label: "CB-312", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-795", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
f1cb = breaker [label: "CB-355", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-740", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
f1pnl = hub [label: "FD-972", rating: "3P+N"]
f1l1ld = load [label: "PNL-1471", rating: "ADMIN PANEL / 52 kW"]
f1l2cb = breaker [label: "CB-380", rating: "MCCB / 32 A / 3P"]
f1l2drv = vfd [label: "DRV-894", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1134", rating: "15 kW / AHU"]
f2cb = breaker [label: "CB-381", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-744", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1033", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-362", rating: "MCCB / 63 A / 3P"]
f2l1drv = vfd [label: "DRV-855", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1126", rating: "25 kW / AHU"]
f3cb = breaker [label: "CB-319", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-714", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1056", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-396", rating: "MCCB / 16 A / 3P"]
f3l1m = motor [label: "MTR-1185", rating: "6 kW / EF"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
