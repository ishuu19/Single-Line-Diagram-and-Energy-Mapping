sld "GEN-1081 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-433", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1695", rating: "170 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-348", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-777", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1072", rating: "kW / kWh"]
f1cb = breaker [label: "CB-338", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-727", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1044", rating: "kW / kWh"]
f1pnl = hub [label: "FD-958", rating: "3P+N"]
f1l1cb = breaker [label: "CB-397", rating: "MCCB / 100 A / 3P"]
f1l1drv = vfd [label: "DRV-803", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1172", rating: "48 kW / PROC"]
f1l2cb = breaker [label: "CB-315", rating: "MCCB / 63 A / 3P"]
f1l2m = motor [label: "MTR-1175", rating: "30 kW / COMP"]
f2cb = breaker [label: "CB-301", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-709", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
f2pnl = hub [label: "FD-902", rating: "3P+N"]
f2l1cb = breaker [label: "CB-398", rating: "MCCB / 125 A / 3P"]
f2l1drv = vfd [label: "DRV-853", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1118", rating: "52 kW / PROC"]
f2l2ld = load [label: "PNL-1459", rating: "SHOP AUXILIARIES / 35 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
