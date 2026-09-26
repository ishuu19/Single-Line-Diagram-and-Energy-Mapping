sld "GEN-0109 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-472", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1651", rating: "170 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-332", rating: "MCCB / 250 A / 3P"]
mctA1 = ct [label: "TA-773", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1041", rating: "kW / kWh"]
f1cb = breaker [label: "CB-329", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-761", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1048", rating: "kW / kWh"]
f1pnl = hub [label: "FD-922", rating: "3P+N"]
f1l1ld = load [label: "PNL-1470", rating: "AUXILIARY PANEL / 20 kW"]
f1l2ld = load [label: "PNL-1463", rating: "TENANT PANEL / 63 kW"]
f2cb = breaker [label: "CB-309", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-719", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1015", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-342", rating: "MCCB / 100 A / 3P"]
f2l1drv = vfd [label: "DRV-820", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1136", rating: "43 kW / CRAC"]
f3cb = breaker [label: "CB-314", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-784", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1077", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-380", rating: "MCCB / 100 A / 3P"]
f3l1drv = vfd [label: "DRV-852", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1141", rating: "44 kW / CRAC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
