sld "GEN-1528 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-441", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1667", rating: "280 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-392", rating: "MCCB / 400 A / 3P"]
mctA1 = ct [label: "TA-709", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1025", rating: "kW / kWh"]
f1cb = breaker [label: "CB-341", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-739", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-383", rating: "MCCB / 80 A / 3P"]
f1l1m = motor [label: "MTR-1122", rating: "34 kW / COND"]
f2cb = breaker [label: "CB-357", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-724", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
f2pnl = hub [label: "FD-917", rating: "3P+N"]
f2l1cb = breaker [label: "CB-315", rating: "MCCB / 80 A / 3P"]
f2l1drv = vfd [label: "DRV-859", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1193", rating: "33 kW / PROC"]
f2l2ld = load [label: "PNL-1455", rating: "PACKAGING PANEL / 22 kW"]
f2x = harmonic_filter [label: "HF-513", rating: "5th / 7th"]
f3cb = breaker [label: "CB-305", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-707", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1098", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-387", rating: "MCCB / 32 A / 3P"]
f3l1m = motor [label: "MTR-1150", rating: "15 kW / COND"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
f2pnl -> f2l2ld
f2pnl -> f2x
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
