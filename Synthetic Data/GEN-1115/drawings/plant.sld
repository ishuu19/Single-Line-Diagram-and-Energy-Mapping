sld "GEN-1115 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-465", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1629", rating: "90 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-399", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-761", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1045", rating: "kW / kWh"]
f1cb = breaker [label: "CB-393", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-775", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1050", rating: "kW / kWh"]
f1pnl = hub [label: "FD-907", rating: "3P+N"]
f1l1cb = breaker [label: "CB-386", rating: "MCCB / 63 A / 3P"]
f1l1drv = vfd [label: "DRV-818", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1194", rating: "14 kW / CRAC"]
f1l2ld = load [label: "PNL-1417", rating: "COMMON AREA LIGHTING / 45 kW"]
f2cb = breaker [label: "CB-376", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-785", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
f2pnl = hub [label: "FD-942", rating: "3P+N"]
f2l1cb = breaker [label: "CB-397", rating: "MCCB / 32 A / 3P"]
f2l1m = motor [label: "MTR-1197", rating: "7 kW / EF"]
f2l2cb = breaker [label: "CB-381", rating: "MCCB / 32 A / 3P"]
f2l2m = motor [label: "MTR-1145", rating: "8 kW / EF"]

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
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1m
f2pnl -> f2l2cb
f2l2cb -> f2l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
