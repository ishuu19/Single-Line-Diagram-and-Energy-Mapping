sld "GEN-0500 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-421", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1698", rating: "440 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-307", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-755", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
f1cb = breaker [label: "CB-301", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-767", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1049", rating: "kW / kWh"]
f1pnl = hub [label: "FD-917", rating: "3P+N"]
f1l1cb = breaker [label: "CB-384", rating: "MCCB / 160 A / 3P"]
f1l1drv = vfd [label: "DRV-803", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1196", rating: "71 kW / PROC"]
f1l2cb = breaker [label: "CB-313", rating: "MCCB / 80 A / 3P"]
f1l2m = motor [label: "MTR-1180", rating: "36 kW / COMP"]
f2cb = breaker [label: "CB-354", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-715", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1088", rating: "kW / kWh"]
f2pnl = hub [label: "FD-904", rating: "3P+N"]
f2l1cb = breaker [label: "CB-367", rating: "MCCB / 63 A / 3P"]
f2l1m = motor [label: "MTR-1143", rating: "28 kW / COMP"]
f2l2ld = load [label: "PNL-1419", rating: "PACKAGING PANEL / 26 kW"]
f2x = harmonic_filter [label: "HF-581", rating: "5th / 7th"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1m
f2pnl -> f2l2ld
f2pnl -> f2x
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
