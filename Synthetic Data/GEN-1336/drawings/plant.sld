sld "GEN-1336 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-453", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
mcbA1 = breaker [label: "CB-346", rating: "MCCB / 250 A / 3P"]
mctA1 = ct [label: "TA-710", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1036", rating: "kW / kWh"]
f1cb = breaker [label: "CB-314", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-713", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1033", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-340", rating: "MCCB / 16 A / 3P"]
f1l1m = motor [label: "MTR-1144", rating: "7 kW / EF"]
f2cb = breaker [label: "CB-310", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-760", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1469", rating: "TENANT PANEL / 93 kW"]
f3cb = breaker [label: "CB-327", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-778", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1043", rating: "kW / kWh"]
f3pnl = hub [label: "FD-931", rating: "3P+N"]
f3l1ld = load [label: "PNL-1440", rating: "TENANT PANEL / 80 kW"]
f3l2cb = breaker [label: "CB-365", rating: "MCCB / 50 A / 3P"]
f3l2drv = vfd [label: "DRV-817", rating: "VFD / OL"]
f3l2m = motor [label: "MTR-1157", rating: "22 kW / CRAC"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2cb
f3l2cb -> f3l2drv
f3l2drv -> f3l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
