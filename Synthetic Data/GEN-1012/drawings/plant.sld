sld "GEN-1012 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-423", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1619", rating: "170 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-304", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-747", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1072", rating: "kW / kWh"]
f1cb = breaker [label: "CB-315", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-740", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1089", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1428", rating: "AUXILIARY PANEL / 19 kW"]
f2cb = breaker [label: "CB-396", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-773", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1068", rating: "kW / kWh"]
f2pnl = hub [label: "FD-930", rating: "3P+N"]
f2l1cb = breaker [label: "CB-387", rating: "MCCB / 32 A / 3P"]
f2l1drv = vfd [label: "DRV-846", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1166", rating: "15 kW / CRAC"]
f2l2cb = breaker [label: "CB-316", rating: "MCCB / 16 A / 3P"]
f2l2m = motor [label: "MTR-1165", rating: "7 kW / EF"]
f3cb = breaker [label: "CB-371", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-716", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1004", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-321", rating: "MCCB / 40 A / 3P"]
f3l1drv = vfd [label: "DRV-873", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1181", rating: "18 kW / CRAC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
f2pnl -> f2l2cb
f2l2cb -> f2l2m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
