sld "GEN-0366 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-472", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1686", rating: "550 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-368", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-722", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1031", rating: "kW / kWh"]
f1cb = breaker [label: "CB-305", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-785", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1020", rating: "kW / kWh"]
f1pnl = hub [label: "FD-900", rating: "3P+N"]
f1l1cb = breaker [label: "CB-380", rating: "MCCB / 32 A / 3P"]
f1l1drv = vfd [label: "DRV-846", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1172", rating: "14 kW / EF"]
f1l2ld = load [label: "PNL-1445", rating: "GROW LIGHTING / 41 kW"]
f2cb = breaker [label: "CB-344", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-716", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1044", rating: "kW / kWh"]
f2pnl = hub [label: "FD-912", rating: "3P+N"]
f2l1cb = breaker [label: "CB-347", rating: "MCCB / 20 A / 3P"]
f2l1drv = vfd [label: "DRV-839", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1174", rating: "8 kW / EF"]
f2l2ld = load [label: "PNL-1428", rating: "GROW LIGHTING / 42 kW"]

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
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
