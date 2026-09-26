sld "GEN-0732 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-400", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1630", rating: "290 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-313", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-780", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1032", rating: "kW / kWh"]
f1cb = breaker [label: "CB-303", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-760", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1068", rating: "kW / kWh"]
f1pnl = hub [label: "FD-977", rating: "3P+N"]
f1l1cb = breaker [label: "CB-375", rating: "MCCB / 125 A / 3P"]
f1l1drv = vfd [label: "DRV-895", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1108", rating: "28 kW / CRAC"]
f1l2ld = load [label: "PNL-1468", rating: "FLOOR LIGHTING / 74 kW"]
f2cb = breaker [label: "CB-374", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-701", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1000", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-347", rating: "MCCB / 125 A / 3P"]
f2l1drv = vfd [label: "DRV-842", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1189", rating: "29 kW / CRAC"]

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
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
