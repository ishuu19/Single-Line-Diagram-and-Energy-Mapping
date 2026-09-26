sld "GEN-0047 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-451", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1648", rating: "690 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-336", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-710", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1000", rating: "kW / kWh"]
f1cb = breaker [label: "CB-368", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-744", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1067", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-316", rating: "MCCB / 50 A / 3P"]
f1l1m = motor [label: "MTR-1158", rating: "24 kW / COND"]
f2cb = breaker [label: "CB-390", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-771", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
f2pnl = hub [label: "FD-925", rating: "3P+N"]
f2l1cb = breaker [label: "CB-352", rating: "MCCB / 125 A / 3P"]
f2l1drv = vfd [label: "DRV-819", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1188", rating: "52 kW / COMP"]
f2l2cb = breaker [label: "CB-343", rating: "MCCB / 80 A / 3P"]
f2l2m = motor [label: "MTR-1196", rating: "34 kW / COND"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
f2pnl -> f2l2cb
f2l2cb -> f2l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
