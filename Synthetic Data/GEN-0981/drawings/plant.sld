sld "GEN-0981 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-428", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1681", rating: "1110 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-379", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-711", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
f1cb = breaker [label: "CB-396", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-796", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1095", rating: "kW / kWh"]
f1pnl = hub [label: "FD-944", rating: "3P+N"]
f1l1ld = load [label: "PNL-1412", rating: "RISER PANEL / 71 kW"]
f1l2ld = load [label: "PNL-1492", rating: "COMMON AREA LIGHTING / 32 kW"]
f2cb = breaker [label: "CB-347", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-788", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-390", rating: "MCCB / 40 A / 3P"]
f2l1drv = vfd [label: "DRV-839", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1163", rating: "18 kW / CRAC"]
f3cb = breaker [label: "CB-321", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-728", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1031", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-323", rating: "MCCB / 63 A / 3P"]
f3l1drv = vfd [label: "DRV-877", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1175", rating: "27 kW / CRAC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
