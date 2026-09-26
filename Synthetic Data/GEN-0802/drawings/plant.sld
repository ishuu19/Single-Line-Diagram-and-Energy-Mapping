sld "GEN-0802 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-409", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1673", rating: "550 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-360", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-720", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1072", rating: "kW / kWh"]
f1cb = breaker [label: "CB-395", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-789", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1067", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-362", rating: "MCCB / 40 A / 3P"]
f1l1m = motor [label: "MTR-1161", rating: "16 kW / COMP"]
f2cb = breaker [label: "CB-371", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-701", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1428", rating: "UTILITY PANEL / 23 kW"]
f3cb = breaker [label: "CB-383", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-756", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1099", rating: "kW / kWh"]
f3pnl = hub [label: "FD-902", rating: "3P+N"]
f3l1ld = load [label: "PNL-1419", rating: "UTILITY PANEL / 10 kW"]
f3l2cb = breaker [label: "CB-398", rating: "MCCB / 80 A / 3P"]
f3l2drv = vfd [label: "DRV-814", rating: "VFD / OL"]
f3l2m = motor [label: "MTR-1166", rating: "37 kW / PROC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#1/0 AWG"]
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
