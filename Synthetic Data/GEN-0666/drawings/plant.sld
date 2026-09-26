sld "GEN-0666 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-418", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1646", rating: "280 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-334", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-793", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1091", rating: "kW / kWh"]
f1cb = breaker [label: "CB-355", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-763", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1043", rating: "kW / kWh"]
f1pnl = hub [label: "FD-925", rating: "3P+N"]
f1l1ld = load [label: "PNL-1482", rating: "PACKAGING PANEL / 17 kW"]
f1l2ld = load [label: "PNL-1456", rating: "AUXILIARY PANEL / 34 kW"]
f2cb = breaker [label: "CB-327", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-731", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1056", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-308", rating: "MCCB / 50 A / 3P"]
f2l1m = motor [label: "MTR-1173", rating: "21 kW / COND"]
f3cb = breaker [label: "CB-385", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-792", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
f3pnl = hub [label: "FD-997", rating: "3P+N"]
f3l1ld = load [label: "PNL-1467", rating: "PACKAGING PANEL / 23 kW"]
f3l2cb = breaker [label: "CB-331", rating: "MCCB / 160 A / 3P"]
f3l2drv = vfd [label: "DRV-865", rating: "VFD / OL"]
f3l2m = motor [label: "MTR-1163", rating: "63 kW / PROC"]

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
f2l1cb -> f2l1m
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2cb
f3l2cb -> f3l2drv
f3l2drv -> f3l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
