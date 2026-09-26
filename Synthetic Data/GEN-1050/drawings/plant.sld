sld "GEN-1050 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-434", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
mcbA1 = breaker [label: "CB-303", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-762", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f1cb = breaker [label: "CB-358", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-759", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1058", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1468", rating: "TENANT PANEL / 80 kW"]
f2cb = breaker [label: "CB-332", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-709", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
f2pnl = hub [label: "FD-930", rating: "3P+N"]
f2l1ld = load [label: "PNL-1448", rating: "FLOOR LIGHTING / 66 kW"]
f2l2cb = breaker [label: "CB-396", rating: "MCCB / 40 A / 3P"]
f2l2drv = vfd [label: "DRV-825", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1122", rating: "17 kW / CRAC"]
f3cb = breaker [label: "CB-362", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-778", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1007", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-336", rating: "MCCB / 100 A / 3P"]
f3l1drv = vfd [label: "DRV-884", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1114", rating: "43 kW / CRAC"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2cb
f2l2cb -> f2l2drv
f2l2drv -> f2l2m
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
