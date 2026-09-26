sld "GEN-0675 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-486", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
mcbA1 = breaker [label: "CB-317", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-791", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
f1cb = breaker [label: "CB-335", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-762", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1039", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1475", rating: "TENANT PANEL / 110 kW"]
f2cb = breaker [label: "CB-322", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-718", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
f2pnl = hub [label: "FD-962", rating: "3P+N"]
f2l1cb = breaker [label: "CB-379", rating: "MCCB / 50 A / 3P"]
f2l1m = motor [label: "MTR-1139", rating: "22 kW / EF"]
f2l2cb = breaker [label: "CB-387", rating: "MCCB / 80 A / 3P"]
f2l2drv = vfd [label: "DRV-816", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1106", rating: "33 kW / CRAC"]
f3cb = breaker [label: "CB-319", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-746", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1096", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-363", rating: "MCCB / 50 A / 3P"]
f3l1drv = vfd [label: "DRV-819", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1197", rating: "23 kW / CRAC"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1m
f2pnl -> f2l2cb
f2l2cb -> f2l2drv
f2l2drv -> f2l2m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
