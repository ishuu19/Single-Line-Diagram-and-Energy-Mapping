sld "GEN-0439 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-430", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1659", rating: "360 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-354", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-723", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
f1cb = breaker [label: "CB-398", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-719", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
f1pnl = hub [label: "FD-972", rating: "3P+N"]
f1l1cb = breaker [label: "CB-393", rating: "MCCB / 200 A / 3P"]
f1l1m = motor [label: "MTR-1126", rating: "51 kW / COMP"]
f1l2ld = load [label: "PNL-1435", rating: "SHOP AUXILIARIES / 20 kW"]
f2cb = breaker [label: "CB-301", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-769", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1087", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-358", rating: "MCCB / 200 A / 3P"]
f2l1drv = vfd [label: "DRV-857", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1169", rating: "45 kW / PROC"]
f3cb = breaker [label: "CB-331", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-794", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1469", rating: "SHOP AUXILIARIES / 40 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
