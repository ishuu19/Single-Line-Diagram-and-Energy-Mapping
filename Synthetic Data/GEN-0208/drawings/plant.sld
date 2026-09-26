sld "GEN-0208 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-478", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1600", rating: "690 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-382", rating: "MCCB / 1000 A / 3P"]
mctA1 = ct [label: "TA-751", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1019", rating: "kW / kWh"]
f1cb = breaker [label: "CB-383", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-720", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
f1pnl = hub [label: "FD-988", rating: "3P+N"]
f1l1cb = breaker [label: "CB-304", rating: "MCCB / 50 A / 3P"]
f1l1drv = vfd [label: "DRV-898", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1132", rating: "21 kW / PROC"]
f1l2cb = breaker [label: "CB-311", rating: "MCCB / 50 A / 3P"]
f1l2m = motor [label: "MTR-1167", rating: "22 kW / COND"]
f2cb = breaker [label: "CB-360", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-761", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1066", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-313", rating: "MCCB / 40 A / 3P"]
f2l1m = motor [label: "MTR-1176", rating: "17 kW / COMP"]
f3cb = breaker [label: "CB-339", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-778", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-344", rating: "MCCB / 50 A / 3P"]
f3l1m = motor [label: "MTR-1131", rating: "21 kW / COND"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2m
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
