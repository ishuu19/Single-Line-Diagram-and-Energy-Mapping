sld "GEN-0645 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-431", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1623", rating: "170 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-397", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-727", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
srcA2 = utility [label: "33kV STANDBY", voltage: "33kV"]
txA2 = transformer_dy [label: "TX-1650", rating: "1390 kVA", voltage: "33kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-368", rating: "ACB / 2000 A / 3P"]
mctA2 = ct [label: "TA-731", rating: "3 CTs / 2000/5 A"]
mpmA2 = watthour_meter [label: "PM-1034", rating: "kW / kWh"]
f1cb = breaker [label: "CB-315", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-792", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
f1pnl = hub [label: "FD-965", rating: "3P+N"]
f1l1ld = load [label: "PNL-1457", rating: "SHOP LIGHTING / 11 kW"]
f1l2cb = breaker [label: "CB-382", rating: "MCCB / 40 A / 3P"]
f1l2drv = vfd [label: "DRV-867", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1143", rating: "17 kW / PROC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
