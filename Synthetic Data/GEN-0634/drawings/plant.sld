sld "GEN-0634 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-409", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1691", rating: "690 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-338", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-774", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1004", rating: "kW / kWh"]
f1cb = breaker [label: "CB-301", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-757", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1077", rating: "kW / kWh"]
f1pnl = hub [label: "FD-980", rating: "3P+N"]
f1l1ld = load [label: "PNL-1428", rating: "COMMON AREA LIGHTING / 53 kW"]
f1l2cb = breaker [label: "CB-379", rating: "MCCB / 32 A / 3P"]
f1l2m = motor [label: "MTR-1100", rating: "15 kW / EF"]
f2cb = breaker [label: "CB-381", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-794", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1078", rating: "kW / kWh"]
f2pnl = hub [label: "FD-934", rating: "3P+N"]
f2l1ld = load [label: "PNL-1450", rating: "RISER PANEL / 72 kW"]
f2l2cb = breaker [label: "CB-305", rating: "MCCB / 32 A / 3P"]
f2l2drv = vfd [label: "DRV-861", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1196", rating: "13 kW / CRAC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2m
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2cb
f2l2cb -> f2l2drv
f2l2drv -> f2l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
