sld "GEN-1249 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-461", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1609", rating: "2080 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-328", rating: "ACB / 3000 A / 3P"]
mctA1 = ct [label: "TA-770", rating: "3 CTs / 3000/5 A"]
mpmA1 = watthour_meter [label: "PM-1081", rating: "kW / kWh"]
f1cb = breaker [label: "CB-343", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-783", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-307", rating: "MCCB / 400 A / 3P"]
f1l1m = motor [label: "MTR-1111", rating: "173 kW / BLOW"]
f2cb = breaker [label: "CB-337", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-753", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1077", rating: "kW / kWh"]
f2pnl = hub [label: "FD-947", rating: "3P+N"]
f2l1cb = breaker [label: "CB-366", rating: "MCCB / 400 A / 3P"]
f2l1m = motor [label: "MTR-1189", rating: "161 kW / BLOW"]
f2l2cb = breaker [label: "CB-381", rating: "MCCB / 500 A / 3P"]
f2l2drv = vfd [label: "DRV-859", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1196", rating: "246 kW / MILL"]

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
f2l1cb -> f2l1m
f2pnl -> f2l2cb
f2l2cb -> f2l2drv
f2l2drv -> f2l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
