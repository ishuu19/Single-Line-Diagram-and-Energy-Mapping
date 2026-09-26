sld "GEN-0903 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-437", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1619", rating: "1390 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-338", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-728", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1067", rating: "kW / kWh"]
f1cb = breaker [label: "CB-322", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-796", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1030", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-389", rating: "MCCB / 400 A / 3P"]
f1l1m = motor [label: "MTR-1107", rating: "189 kW / BLOW"]
f2cb = breaker [label: "CB-398", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-724", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1045", rating: "kW / kWh"]
f2pnl = hub [label: "FD-932", rating: "3P+N"]
f2l1cb = breaker [label: "CB-377", rating: "MCCB / 250 A / 3P"]
f2l1m = motor [label: "MTR-1128", rating: "107 kW / BLOW"]
f2l2ld = load [label: "PNL-1489", rating: "AUXILIARY PANEL / 377 kW"]
f3cb = breaker [label: "CB-376", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-715", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1016", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-331", rating: "MCCB / 630 A / 3P"]
f3l1drv = vfd [label: "DRV-889", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1193", rating: "308 kW / MILL"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1m
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
