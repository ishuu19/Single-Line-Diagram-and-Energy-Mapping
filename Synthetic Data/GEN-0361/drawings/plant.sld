sld "GEN-0361 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-429", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
mcbA1 = breaker [label: "CB-371", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-762", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1007", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 381 kW", voltage: "480Y/277V"]
mcbA2 = breaker [label: "CB-329", rating: "MCCB / 160 A / 3P"]
mctA2 = ct [label: "TA-702", rating: "3 CTs / 160/5 A"]
mpmA2 = watthour_meter [label: "PM-1096", rating: "kW / kWh"]
f1cb = breaker [label: "CB-316", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-776", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1097", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-318", rating: "MCCB / 50 A / 3P"]
f1l1drv = vfd [label: "DRV-881", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1101", rating: "25 kW / AHU"]
f2cb = breaker [label: "CB-360", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-778", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
f2pnl = hub [label: "FD-981", rating: "3P+N"]
f2l1cb = breaker [label: "CB-324", rating: "MCCB / 40 A / 3P"]
f2l1drv = vfd [label: "DRV-801", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1122", rating: "20 kW / AHU"]
f2l2ld = load [label: "PNL-1494", rating: "SITE LIGHTING / 29 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
f2pnl -> f2l2ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
