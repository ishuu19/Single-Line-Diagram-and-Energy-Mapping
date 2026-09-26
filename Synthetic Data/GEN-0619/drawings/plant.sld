sld "GEN-0619 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-499", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1642", rating: "690 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-395", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-757", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1073", rating: "kW / kWh"]
f1cb = breaker [label: "CB-372", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-713", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1017", rating: "kW / kWh"]
f1pnl = hub [label: "FD-983", rating: "3P+N"]
f1l1cb = breaker [label: "CB-337", rating: "MCCB / 100 A / 3P"]
f1l1drv = vfd [label: "DRV-804", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1114", rating: "47 kW / PROC"]
f1l2cb = breaker [label: "CB-346", rating: "MCCB / 160 A / 3P"]
f1l2drv = vfd [label: "DRV-856", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1117", rating: "67 kW / PROC"]
f2cb = breaker [label: "CB-312", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-738", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-371", rating: "MCCB / 160 A / 3P"]
f2l1drv = vfd [label: "DRV-810", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1180", rating: "68 kW / PROC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
