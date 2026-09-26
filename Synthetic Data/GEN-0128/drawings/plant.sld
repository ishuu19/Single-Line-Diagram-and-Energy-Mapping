sld "GEN-0128 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-460", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1618", rating: "550 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-391", rating: "MCCB / 800 A / 3P"]
mctA1 = ct [label: "TA-732", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
f1cb = breaker [label: "CB-343", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-712", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1022", rating: "kW / kWh"]
f1pnl = hub [label: "FD-980", rating: "3P+N"]
f1l1ld = load [label: "PNL-1488", rating: "TENANT PANEL / 42 kW"]
f1l2ld = load [label: "PNL-1486", rating: "TENANT PANEL / 104 kW"]
f2cb = breaker [label: "CB-326", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-724", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1089", rating: "kW / kWh"]
f2pnl = hub [label: "FD-928", rating: "3P+N"]
f2l1ld = load [label: "PNL-1467", rating: "FLOOR LIGHTING / 58 kW"]
f2l2cb = breaker [label: "CB-358", rating: "MCCB / 80 A / 3P"]
f2l2drv = vfd [label: "DRV-843", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1180", rating: "37 kW / CRAC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2cb
f2l2cb -> f2l2drv
f2l2drv -> f2l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
