sld "GEN-0956 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-447", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1635", rating: "1110 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-325", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-778", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1081", rating: "kW / kWh"]
f1cb = breaker [label: "CB-380", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-729", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1058", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-342", rating: "MCCB / 100 A / 3P"]
f1l1drv = vfd [label: "DRV-850", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1118", rating: "44 kW / PROC"]
f1x = harmonic_filter [label: "HF-583", rating: "5th / 7th"]
f2cb = breaker [label: "CB-378", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-763", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
f2pnl = hub [label: "FD-947", rating: "3P+N"]
f2l1ld = load [label: "PNL-1473", rating: "PACKAGING PANEL / 25 kW"]
f2l2cb = breaker [label: "CB-381", rating: "MCCB / 63 A / 3P"]
f2l2m = motor [label: "MTR-1168", rating: "28 kW / COND"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
f1ct -> f1x
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2cb
f2l2cb -> f2l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
