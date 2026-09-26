sld "GEN-0122 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-436", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1667", rating: "280 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-374", rating: "MCCB / 400 A / 3P"]
mctA1 = ct [label: "TA-704", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1049", rating: "kW / kWh"]
f1cb = breaker [label: "CB-326", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-741", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1015", rating: "kW / kWh"]
f1pnl = hub [label: "FD-950", rating: "3P+N"]
f1l1ld = load [label: "PNL-1429", rating: "SHOP LIGHTING / 19 kW"]
f1l2ld = load [label: "PNL-1440", rating: "AUXILIARY PANEL / 31 kW"]
f2cb = breaker [label: "CB-307", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-723", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1026", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1420", rating: "AUXILIARY PANEL / 37 kW"]
f3cb = breaker [label: "CB-360", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-739", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1011", rating: "kW / kWh"]
f3pnl = hub [label: "FD-941", rating: "3P+N"]
f3l1ld = load [label: "PNL-1459", rating: "PRESS FLOOR PANEL / 38 kW"]
f3l2cb = breaker [label: "CB-359", rating: "MCCB / 50 A / 3P"]
f3l2drv = vfd [label: "DRV-831", rating: "VFD / OL"]
f3l2m = motor [label: "MTR-1131", rating: "23 kW / PROC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2cb
f3l2cb -> f3l2drv
f3l2drv -> f3l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
