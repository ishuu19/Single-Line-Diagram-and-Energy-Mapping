sld "GEN-0761 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-462", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1690", rating: "1390 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-323", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-798", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1068", rating: "kW / kWh"]
f1cb = breaker [label: "CB-359", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-747", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1088", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-398", rating: "MCCB / 16 A / 3P"]
f1l1m = motor [label: "MTR-1146", rating: "5 kW / EF"]
f2cb = breaker [label: "CB-375", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-724", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1045", rating: "kW / kWh"]
f2pnl = hub [label: "FD-919", rating: "3P+N"]
f2l1ld = load [label: "PNL-1458", rating: "AUXILIARY PANEL / 75 kW"]
f2l2cb = breaker [label: "CB-335", rating: "MCCB / 125 A / 3P"]
f2l2drv = vfd [label: "DRV-811", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1172", rating: "58 kW / COMP"]
f3cb = breaker [label: "CB-372", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-756", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-309", rating: "MCCB / 200 A / 3P"]
f3l1drv = vfd [label: "DRV-870", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1144", rating: "86 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2cb
f2l2cb -> f2l2drv
f2l2drv -> f2l2m
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
