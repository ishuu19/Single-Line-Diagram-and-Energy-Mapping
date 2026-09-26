sld "GEN-1435 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-483", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
mcbA1 = breaker [label: "CB-364", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-777", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1004", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 481 kW", voltage: "400Y/230V"]
mcbA2 = breaker [label: "CB-341", rating: "MCCB / 400 A / 3P"]
mctA2 = ct [label: "TA-707", rating: "3 CTs / 400/5 A"]
mpmA2 = watthour_meter [label: "PM-1053", rating: "kW / kWh"]
f1cb = breaker [label: "CB-311", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-767", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1019", rating: "kW / kWh"]
f1pnl = hub [label: "FD-932", rating: "3P+N"]
f1l1cb = breaker [label: "CB-378", rating: "MCCB / 50 A / 3P"]
f1l1drv = vfd [label: "DRV-883", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1148", rating: "21 kW / AHU"]
f1l2cb = breaker [label: "CB-304", rating: "MCCB / 25 A / 3P"]
f1l2m = motor [label: "MTR-1190", rating: "12 kW / EF"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
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
