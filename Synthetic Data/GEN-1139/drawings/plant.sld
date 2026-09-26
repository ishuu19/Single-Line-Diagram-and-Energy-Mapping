sld "GEN-1139 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-407", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1677", rating: "1390 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-374", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-733", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f1cb = breaker [label: "CB-325", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-703", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1073", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-347", rating: "MCCB / 40 A / 3P"]
f1l1drv = vfd [label: "DRV-883", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1117", rating: "17 kW / PROC"]
f2cb = breaker [label: "CB-321", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-762", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1066", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1449", rating: "SHOP LIGHTING / 22 kW"]

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
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
