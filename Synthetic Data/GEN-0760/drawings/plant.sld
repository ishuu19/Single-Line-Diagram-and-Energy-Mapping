sld "GEN-0760 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-451", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1661", rating: "550 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-373", rating: "MCCB / 800 A / 3P"]
mctA1 = ct [label: "TA-766", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1057", rating: "kW / kWh"]
srcA2 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "500 kW"]
mcbA2 = breaker [label: "CB-301", rating: "ACB / 800 A / 3P"]
mctA2 = ct [label: "TA-793", rating: "3 CTs / 800/5 A"]
mpmA2 = watthour_meter [label: "PM-1048", rating: "kW / kWh"]
f1cb = breaker [label: "CB-365", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-721", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1077", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1433", rating: "COMMON AREA LIGHTING / 45 kW"]
f2cb = breaker [label: "CB-390", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-744", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
f2pnl = hub [label: "FD-980", rating: "3P+N"]
f2l1cb = breaker [label: "CB-330", rating: "MCCB / 25 A / 3P"]
f2l1drv = vfd [label: "DRV-880", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1119", rating: "11 kW / CRAC"]
f2l2ld = load [label: "PNL-1446", rating: "RISER PANEL / 77 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
f2pnl -> f2l2ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
