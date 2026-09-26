sld "GEN-1518 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-424", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1659", rating: "670 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-383", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-772", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
f1cb = breaker [label: "CB-333", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-792", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1087", rating: "kW / kWh"]
f1pnl = hub [label: "FD-912", rating: "3P+N"]
f1l1ld = load [label: "PNL-1440", rating: "PRESS FLOOR PANEL / 33 kW"]
f1l2ld = load [label: "PNL-1439", rating: "SHOP LIGHTING / 21 kW"]
f2cb = breaker [label: "CB-314", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-728", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1011", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-323", rating: "MCCB / 50 A / 3P"]
f2l1drv = vfd [label: "DRV-818", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1125", rating: "27 kW / PROC"]
f3cb = breaker [label: "CB-316", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-717", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1095", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1478", rating: "PRESS FLOOR PANEL / 30 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
