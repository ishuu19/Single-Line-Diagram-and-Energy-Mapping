sld "GEN-1419 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-430", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1670", rating: "170 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-332", rating: "MCCB / 250 A / 3P"]
mctA1 = ct [label: "TA-713", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1047", rating: "kW / kWh"]
f1cb = breaker [label: "CB-372", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-774", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1015", rating: "kW / kWh"]
f1pnl = hub [label: "FD-930", rating: "3P+N"]
f1l1cb = breaker [label: "CB-392", rating: "MCCB / 40 A / 3P"]
f1l1m = motor [label: "MTR-1180", rating: "17 kW / COND"]
f1l2ld = load [label: "PNL-1401", rating: "PACKAGING PANEL / 12 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2ld
mctA1 -> mpmA1
f1ct -> f1pm
