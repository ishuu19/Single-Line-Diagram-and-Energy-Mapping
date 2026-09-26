sld "GEN-1125 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-402", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1680", rating: "690 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-378", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-717", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1095", rating: "kW / kWh"]
f1cb = breaker [label: "CB-347", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-788", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
f1pnl = hub [label: "FD-913", rating: "3P+N"]
f1l1cb = breaker [label: "CB-364", rating: "MCCB / 1000 A / 3P"]
f1l1drv = vfd [label: "DRV-812", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1158", rating: "425 kW / MILL"]
f1l2cb = breaker [label: "CB-382", rating: "MCCB / 630 A / 3P"]
f1l2drv = vfd [label: "DRV-804", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1169", rating: "253 kW / MILL"]
f2cb = breaker [label: "CB-340", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-764", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1047", rating: "kW / kWh"]
f2pnl = hub [label: "FD-923", rating: "3P+N"]
f2l1ld = load [label: "PNL-1412", rating: "MCC AUXILIARY BOARD / 56 kW"]
f2l2cb = breaker [label: "CB-398", rating: "MCCB / 630 A / 3P"]
f2l2drv = vfd [label: "DRV-852", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1160", rating: "250 kW / MILL"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2cb
f2l2cb -> f2l2drv
f2l2drv -> f2l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
