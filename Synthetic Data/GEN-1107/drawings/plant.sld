sld "GEN-1107 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-435", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1637", rating: "550 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-366", rating: "MCCB / 800 A / 3P"]
mctA1 = ct [label: "TA-798", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1089", rating: "kW / kWh"]
f1cb = breaker [label: "CB-359", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-710", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1490", rating: "AUXILIARY PANEL / 14 kW"]
f2cb = breaker [label: "CB-345", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-787", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
f2pnl = hub [label: "FD-946", rating: "3P+N"]
f2l1ld = load [label: "PNL-1433", rating: "COMMON AREA LIGHTING / 31 kW"]
f2l2ld = load [label: "PNL-1441", rating: "AUXILIARY PANEL / 21 kW"]
f3cb = breaker [label: "CB-333", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-762", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1050", rating: "kW / kWh"]
f3pnl = hub [label: "FD-911", rating: "3P+N"]
f3l1cb = breaker [label: "CB-397", rating: "MCCB / 63 A / 3P"]
f3l1drv = vfd [label: "DRV-805", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1154", rating: "26 kW / CRAC"]
f3l2ld = load [label: "PNL-1458", rating: "RISER PANEL / 86 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
