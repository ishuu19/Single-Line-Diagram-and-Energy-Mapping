sld "GEN-1392 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-458", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1617", rating: "280 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-347", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-761", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1030", rating: "kW / kWh"]
f1cb = breaker [label: "CB-338", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-777", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1402", rating: "TENANT PANEL / 109 kW"]
f2cb = breaker [label: "CB-318", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-738", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1098", rating: "kW / kWh"]
f2pnl = hub [label: "FD-948", rating: "3P+N"]
f2l1ld = load [label: "PNL-1405", rating: "FLOOR LIGHTING / 76 kW"]
f2l2cb = breaker [label: "CB-357", rating: "MCCB / 63 A / 3P"]
f2l2drv = vfd [label: "DRV-879", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1168", rating: "31 kW / CRAC"]
f3cb = breaker [label: "CB-311", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-793", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1036", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1408", rating: "FLOOR LIGHTING / 86 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2cb
f2l2cb -> f2l2drv
f2l2drv -> f2l2m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
