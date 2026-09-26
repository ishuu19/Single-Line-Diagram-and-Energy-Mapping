sld "GEN-0700 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-410", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1672", rating: "1390 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-300", rating: "MCCB / 2000 A / 3P"]
mctA1 = ct [label: "TA-705", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1018", rating: "kW / kWh"]
f1cb = breaker [label: "CB-340", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-702", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1021", rating: "kW / kWh"]
f1pnl = hub [label: "FD-993", rating: "3P+N"]
f1l1cb = breaker [label: "CB-395", rating: "MCCB / 320 A / 3P"]
f1l1m = motor [label: "MTR-1107", rating: "158 kW / BLOW"]
f1l2cb = breaker [label: "CB-324", rating: "MCCB / 800 A / 3P"]
f1l2drv = vfd [label: "DRV-825", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1166", rating: "367 kW / MILL"]
f2cb = breaker [label: "CB-346", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-719", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1040", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-335", rating: "MCCB / 630 A / 3P"]
f2l1drv = vfd [label: "DRV-848", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1178", rating: "298 kW / MILL"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
