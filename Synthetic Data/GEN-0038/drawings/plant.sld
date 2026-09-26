sld "GEN-0038 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-466", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1660", rating: "1080 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-358", rating: "ACB / 3000 A / 3P"]
mctA1 = ct [label: "TA-714", rating: "3 CTs / 3000/5 A"]
mpmA1 = watthour_meter [label: "PM-1076", rating: "kW / kWh"]
f1cb = breaker [label: "CB-373", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-785", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1019", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-381", rating: "MCCB / 630 A / 3P"]
f1l1m = motor [label: "MTR-1154", rating: "159 kW / BLOW"]
f2cb = breaker [label: "CB-303", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-763", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-391", rating: "MCCB / 1000 A / 3P"]
f2l1drv = vfd [label: "DRV-825", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1184", rating: "335 kW / MILL"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
