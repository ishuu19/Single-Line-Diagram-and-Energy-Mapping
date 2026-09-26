sld "GEN-1153 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-478", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1605", rating: "550 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-307", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-774", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1098", rating: "kW / kWh"]
f1cb = breaker [label: "CB-325", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-788", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1056", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-302", rating: "MCCB / 63 A / 3P"]
f1l1drv = vfd [label: "DRV-818", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1176", rating: "27 kW / PROC"]
f2cb = breaker [label: "CB-357", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-765", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1097", rating: "kW / kWh"]
f2pnl = hub [label: "FD-947", rating: "3P+N"]
f2l1cb = breaker [label: "CB-384", rating: "MCCB / 100 A / 3P"]
f2l1drv = vfd [label: "DRV-861", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1147", rating: "40 kW / PROC"]
f2l2cb = breaker [label: "CB-337", rating: "MCCB / 63 A / 3P"]
f2l2m = motor [label: "MTR-1153", rating: "31 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
f2pnl -> f2l2cb
f2l2cb -> f2l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
