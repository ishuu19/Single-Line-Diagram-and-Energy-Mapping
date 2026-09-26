sld "GEN-1161 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-490", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1670", rating: "1390 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-375", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-711", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
f1cb = breaker [label: "CB-342", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-709", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1017", rating: "kW / kWh"]
f1pnl = hub [label: "FD-953", rating: "3P+N"]
f1l1cb = breaker [label: "CB-340", rating: "MCCB / 63 A / 3P"]
f1l1drv = vfd [label: "DRV-840", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1129", rating: "30 kW / PROC"]
f1l2cb = breaker [label: "CB-336", rating: "MCCB / 50 A / 3P"]
f1l2m = motor [label: "MTR-1145", rating: "21 kW / COND"]
f2cb = breaker [label: "CB-368", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-757", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1475", rating: "PACKAGING PANEL / 14 kW"]
f3cb = breaker [label: "CB-367", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-795", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1003", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-388", rating: "MCCB / 125 A / 3P"]
f3l1m = motor [label: "MTR-1122", rating: "50 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
