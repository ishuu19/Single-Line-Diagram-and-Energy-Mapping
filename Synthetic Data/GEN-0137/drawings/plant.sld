sld "GEN-0137 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-447", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1694", rating: "550 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-366", rating: "MCCB / 800 A / 3P"]
mctA1 = ct [label: "TA-753", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1081", rating: "kW / kWh"]
srcA2 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "400 kW"]
mcbA2 = breaker [label: "CB-354", rating: "ACB / 630 A / 3P"]
mctA2 = ct [label: "TA-718", rating: "3 CTs / 630/5 A"]
mpmA2 = watthour_meter [label: "PM-1072", rating: "kW / kWh"]
f1cb = breaker [label: "CB-376", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-717", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1014", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-399", rating: "MCCB / 125 A / 3P"]
f1l1drv = vfd [label: "DRV-884", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1135", rating: "53 kW / PROC"]
f2cb = breaker [label: "CB-304", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-791", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1099", rating: "kW / kWh"]
f2pnl = hub [label: "FD-960", rating: "3P+N"]
f2l1ld = load [label: "PNL-1403", rating: "PACKAGING PANEL / 23 kW"]
f2l2cb = breaker [label: "CB-322", rating: "MCCB / 125 A / 3P"]
f2l2m = motor [label: "MTR-1146", rating: "50 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2cb
f2l2cb -> f2l2m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
