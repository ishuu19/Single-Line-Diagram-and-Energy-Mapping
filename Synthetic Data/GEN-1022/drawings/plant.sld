sld "GEN-1022 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-492", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
mcbA1 = breaker [label: "CB-391", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-791", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1054", rating: "kW / kWh"]
f1cb = breaker [label: "CB-319", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-712", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1053", rating: "kW / kWh"]
f1pnl = hub [label: "FD-958", rating: "3P+N"]
f1l1cb = breaker [label: "CB-309", rating: "MCCB / 25 A / 3P"]
f1l1m = motor [label: "MTR-1127", rating: "11 kW / EF"]
f1l2cb = breaker [label: "CB-318", rating: "MCCB / 80 A / 3P"]
f1l2drv = vfd [label: "DRV-853", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1153", rating: "32 kW / AHU"]
f2cb = breaker [label: "CB-307", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-767", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1088", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1421", rating: "ADMIN PANEL / 71 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
