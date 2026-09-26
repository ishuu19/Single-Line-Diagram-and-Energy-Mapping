sld "GEN-1493 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-483", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1687", rating: "440 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-399", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-703", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1095", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 370 kW", voltage: "400Y/230V"]
mcbA2 = breaker [label: "CB-341", rating: "MCCB / 400 A / 3P"]
mctA2 = ct [label: "TA-789", rating: "3 CTs / 400/5 A"]
mpmA2 = watthour_meter [label: "PM-1014", rating: "kW / kWh"]
f1cb = breaker [label: "CB-391", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-717", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1423", rating: "ADMIN PANEL / 49 kW"]
f2cb = breaker [label: "CB-311", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-728", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
f2pnl = hub [label: "FD-952", rating: "3P+N"]
f2l1cb = breaker [label: "CB-384", rating: "MCCB / 63 A / 3P"]
f2l1drv = vfd [label: "DRV-899", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1140", rating: "29 kW / AHU"]
f2l2ld = load [label: "PNL-1445", rating: "ADMIN PANEL / 51 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
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
