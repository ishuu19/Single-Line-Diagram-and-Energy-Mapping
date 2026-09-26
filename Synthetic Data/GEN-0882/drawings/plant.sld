sld "GEN-0882 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-432", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1653", rating: "1110 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-363", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-701", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1037", rating: "kW / kWh"]
f1cb = breaker [label: "CB-351", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-700", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1046", rating: "kW / kWh"]
f1pnl = hub [label: "FD-919", rating: "3P+N"]
f1l1cb = breaker [label: "CB-322", rating: "MCCB / 32 A / 3P"]
f1l1m = motor [label: "MTR-1166", rating: "14 kW / EF"]
f1l2cb = breaker [label: "CB-355", rating: "MCCB / 50 A / 3P"]
f1l2drv = vfd [label: "DRV-828", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1105", rating: "21 kW / CRAC"]
f2cb = breaker [label: "CB-390", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-765", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1025", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-385", rating: "MCCB / 40 A / 3P"]
f2l1drv = vfd [label: "DRV-823", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1174", rating: "17 kW / CRAC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
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
