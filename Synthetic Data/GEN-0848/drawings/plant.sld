sld "GEN-0848 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-425", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
mcbA1 = breaker [label: "CB-397", rating: "ACB / 3000 A / 3P"]
mctA1 = ct [label: "TA-709", rating: "3 CTs / 3000/5 A"]
mpmA1 = watthour_meter [label: "PM-1003", rating: "kW / kWh"]
f1cb = breaker [label: "CB-324", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-708", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1015", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-369", rating: "MCCB / 400 A / 3P"]
f1l1m = motor [label: "MTR-1161", rating: "188 kW / BLOW"]
f2cb = breaker [label: "CB-364", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-721", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1072", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1498", rating: "MCC AUXILIARY BOARD / 42 kW"]
f3cb = breaker [label: "CB-388", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-793", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
f3pnl = hub [label: "FD-980", rating: "3P+N"]
f3l1cb = breaker [label: "CB-321", rating: "MCCB / 1000 A / 3P"]
f3l1drv = vfd [label: "DRV-815", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1142", rating: "594 kW / MILL"]
f3l2cb = breaker [label: "CB-335", rating: "MCCB / 500 A / 3P"]
f3l2drv = vfd [label: "DRV-881", rating: "VFD / OL"]
f3l2m = motor [label: "MTR-1123", rating: "243 kW / MILL"]

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
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
f3pnl -> f3l2cb
f3l2cb -> f3l2drv
f3l2drv -> f3l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
