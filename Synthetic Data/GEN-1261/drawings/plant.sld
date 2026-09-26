sld "GEN-1261 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-426", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
mcbA1 = breaker [label: "CB-385", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-786", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1048", rating: "kW / kWh"]
f1cb = breaker [label: "CB-342", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-771", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1022", rating: "kW / kWh"]
f1pnl = hub [label: "FD-923", rating: "3P+N"]
f1l1ld = load [label: "PNL-1425", rating: "FLOOR LIGHTING / 64 kW"]
f1l2cb = breaker [label: "CB-338", rating: "MCCB / 32 A / 3P"]
f1l2m = motor [label: "MTR-1125", rating: "19 kW / EF"]
f2cb = breaker [label: "CB-309", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-731", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1090", rating: "kW / kWh"]
f2pnl = hub [label: "FD-911", rating: "3P+N"]
f2l1ld = load [label: "PNL-1497", rating: "FLOOR LIGHTING / 55 kW"]
f2l2cb = breaker [label: "CB-395", rating: "MCCB / 32 A / 3P"]
f2l2drv = vfd [label: "DRV-825", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1128", rating: "15 kW / CRAC"]
f3cb = breaker [label: "CB-340", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-762", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1439", rating: "TENANT PANEL / 80 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2cb
f2l2cb -> f2l2drv
f2l2drv -> f2l2m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
