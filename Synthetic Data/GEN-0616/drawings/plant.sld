sld "GEN-0616 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-401", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1654", rating: "440 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-314", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-726", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
f1cb = breaker [label: "CB-363", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-787", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1408", rating: "SHOP LIGHTING / 35 kW"]
f2cb = breaker [label: "CB-310", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-745", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1051", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-347", rating: "MCCB / 125 A / 3P"]
f2l1drv = vfd [label: "DRV-801", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1136", rating: "51 kW / PROC"]
f3cb = breaker [label: "CB-348", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-740", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1040", rating: "kW / kWh"]
f3pnl = hub [label: "FD-940", rating: "3P+N"]
f3l1cb = breaker [label: "CB-321", rating: "MCCB / 125 A / 3P"]
f3l1drv = vfd [label: "DRV-887", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1197", rating: "56 kW / PROC"]
f3l2cb = breaker [label: "CB-327", rating: "MCCB / 100 A / 3P"]
f3l2m = motor [label: "MTR-1147", rating: "44 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
f3pnl -> f3l2cb
f3l2cb -> f3l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
