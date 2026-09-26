sld "GEN-0396 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-406", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1677", rating: "690 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-363", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-789", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
f1cb = breaker [label: "CB-304", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-761", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-392", rating: "MCCB / 125 A / 3P"]
f1l1m = motor [label: "MTR-1108", rating: "55 kW / COMP"]
f2cb = breaker [label: "CB-337", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-708", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-318", rating: "MCCB / 125 A / 3P"]
f2l1drv = vfd [label: "DRV-898", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1147", rating: "51 kW / PROC"]
f3cb = breaker [label: "CB-361", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-778", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1018", rating: "kW / kWh"]
f3pnl = hub [label: "FD-916", rating: "3P+N"]
f3l1cb = breaker [label: "CB-398", rating: "MCCB / 63 A / 3P"]
f3l1m = motor [label: "MTR-1189", rating: "31 kW / COND"]
f3l2cb = breaker [label: "CB-347", rating: "MCCB / 50 A / 3P"]
f3l2m = motor [label: "MTR-1193", rating: "22 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1cb
f3l1cb -> f3l1m
f3pnl -> f3l2cb
f3l2cb -> f3l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
