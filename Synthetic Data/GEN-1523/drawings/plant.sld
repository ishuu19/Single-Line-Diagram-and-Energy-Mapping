sld "GEN-1523 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-480", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1619", rating: "1390 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-384", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-724", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1021", rating: "kW / kWh"]
f1cb = breaker [label: "CB-350", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-794", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1066", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-316", rating: "MCCB / 160 A / 3P"]
f1l1drv = vfd [label: "DRV-879", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1111", rating: "66 kW / PROC"]
f2cb = breaker [label: "CB-336", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-763", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f2pnl = hub [label: "FD-970", rating: "3P+N"]
f2l1cb = breaker [label: "CB-386", rating: "MCCB / 63 A / 3P"]
f2l1m = motor [label: "MTR-1152", rating: "29 kW / COND"]
f2l2cb = breaker [label: "CB-357", rating: "MCCB / 63 A / 3P"]
f2l2m = motor [label: "MTR-1162", rating: "28 kW / COND"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1m
f2pnl -> f2l2cb
f2l2cb -> f2l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
