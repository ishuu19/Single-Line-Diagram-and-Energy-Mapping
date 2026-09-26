sld "GEN-0338 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-432", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1670", rating: "170 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-336", rating: "MCCB / 250 A / 3P"]
mctA1 = ct [label: "TA-747", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1097", rating: "kW / kWh"]
f1cb = breaker [label: "CB-380", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-770", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1098", rating: "kW / kWh"]
f1pnl = hub [label: "FD-955", rating: "3P+N"]
f1l1ld = load [label: "PNL-1429", rating: "CELLAR PANEL / 16 kW"]
f1l2cb = breaker [label: "CB-313", rating: "MCCB / 80 A / 3P"]
f1l2drv = vfd [label: "DRV-869", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1165", rating: "35 kW / PROC"]
f2cb = breaker [label: "CB-355", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-790", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-316", rating: "MCCB / 63 A / 3P"]
f2l1drv = vfd [label: "DRV-821", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1191", rating: "27 kW / PROC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
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
