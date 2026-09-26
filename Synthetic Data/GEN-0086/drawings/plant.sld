sld "GEN-0086 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-481", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1613", rating: "550 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-388", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-749", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1029", rating: "kW / kWh"]
f1cb = breaker [label: "CB-347", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-757", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-303", rating: "MCCB / 16 A / 3P"]
f1l1m = motor [label: "MTR-1171", rating: "5 kW / EF"]
f2cb = breaker [label: "CB-365", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-705", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1095", rating: "kW / kWh"]
f2pnl = hub [label: "FD-919", rating: "3P+N"]
f2l1ld = load [label: "PNL-1454", rating: "UTILITY PANEL / 22 kW"]
f2l2ld = load [label: "PNL-1489", rating: "AUXILIARY PANEL / 35 kW"]
f3cb = breaker [label: "CB-377", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-732", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1060", rating: "kW / kWh"]
f3pnl = hub [label: "FD-972", rating: "3P+N"]
f3l1cb = breaker [label: "CB-372", rating: "MCCB / 50 A / 3P"]
f3l1m = motor [label: "MTR-1128", rating: "23 kW / COMP"]
f3l2ld = load [label: "PNL-1430", rating: "UTILITY PANEL / 19 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1cb
f3l1cb -> f3l1m
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
