sld "GEN-1287 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-462", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1645", rating: "670 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-384", rating: "MCCB / 800 A / 3P"]
mctA1 = ct [label: "TA-727", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1090", rating: "kW / kWh"]
f1cb = breaker [label: "CB-394", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-781", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-365", rating: "MCCB / 16 A / 3P"]
f1l1drv = vfd [label: "DRV-852", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1153", rating: "8 kW / EF"]
f2cb = breaker [label: "CB-378", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-783", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1069", rating: "kW / kWh"]
f2pnl = hub [label: "FD-959", rating: "3P+N"]
f2l1cb = breaker [label: "CB-375", rating: "MCCB / 32 A / 3P"]
f2l1m = motor [label: "MTR-1100", rating: "19 kW / RWP"]
f2l2cb = breaker [label: "CB-305", rating: "MCCB / 32 A / 3P"]
f2l2m = motor [label: "MTR-1126", rating: "16 kW / RWP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
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
