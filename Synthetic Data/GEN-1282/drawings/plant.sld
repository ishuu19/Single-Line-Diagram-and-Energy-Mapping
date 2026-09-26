sld "GEN-1282 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-492", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1660", rating: "280 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-356", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-733", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1044", rating: "kW / kWh"]
f1cb = breaker [label: "CB-329", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-796", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
f1pnl = hub [label: "FD-924", rating: "3P+N"]
f1l1cb = breaker [label: "CB-384", rating: "MCCB / 160 A / 3P"]
f1l1drv = vfd [label: "DRV-882", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1164", rating: "70 kW / PROC"]
f1l2ld = load [label: "PNL-1448", rating: "PACKAGING PANEL / 13 kW"]
f1x = harmonic_filter [label: "HF-553", rating: "5th / 7th"]

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
f1pnl -> f1l2ld
f1pnl -> f1x
mctA1 -> mpmA1
f1ct -> f1pm
