sld "GEN-0668 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-493", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1674", rating: "1390 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-315", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-763", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1099", rating: "kW / kWh"]
f1cb = breaker [label: "CB-355", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-704", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
f1pnl = hub [label: "FD-972", rating: "3P+N"]
f1l1cb = breaker [label: "CB-385", rating: "MCCB / 100 A / 3P"]
f1l1m = motor [label: "MTR-1126", rating: "47 kW / COMP"]
f1l2ld = load [label: "PNL-1461", rating: "PACKAGING PANEL / 13 kW"]
f2cb = breaker [label: "CB-394", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-700", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1438", rating: "PACKAGING PANEL / 10 kW"]
f3cb = breaker [label: "CB-329", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-714", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
f3pnl = hub [label: "FD-967", rating: "3P+N"]
f3l1cb = breaker [label: "CB-391", rating: "MCCB / 125 A / 3P"]
f3l1drv = vfd [label: "DRV-834", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1178", rating: "62 kW / PROC"]
f3l2ld = load [label: "PNL-1436", rating: "PACKAGING PANEL / 25 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
