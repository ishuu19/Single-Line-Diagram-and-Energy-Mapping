sld "GEN-0558 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-486", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1681", rating: "1110 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-351", rating: "MCCB / 1600 A / 3P"]
mctA1 = ct [label: "TA-746", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1091", rating: "kW / kWh"]
f1cb = breaker [label: "CB-352", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-760", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1069", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-322", rating: "MCCB / 160 A / 3P"]
f1l1drv = vfd [label: "DRV-807", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1198", rating: "75 kW / PROC"]
f2cb = breaker [label: "CB-320", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-767", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f2pnl = hub [label: "FD-986", rating: "3P+N"]
f2l1ld = load [label: "PNL-1475", rating: "PACKAGING PANEL / 14 kW"]
f2l2cb = breaker [label: "CB-399", rating: "MCCB / 160 A / 3P"]
f2l2drv = vfd [label: "DRV-887", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1169", rating: "64 kW / PROC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2cb
f2l2cb -> f2l2drv
f2l2drv -> f2l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
