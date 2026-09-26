sld "GEN-0307 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-442", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1650", rating: "1390 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-379", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-729", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1041", rating: "kW / kWh"]
f1cb = breaker [label: "CB-362", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-703", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
f1pnl = hub [label: "FD-952", rating: "3P+N"]
f1l1ld = load [label: "PNL-1412", rating: "CELLAR PANEL / 14 kW"]
f1l2cb = breaker [label: "CB-306", rating: "MCCB / 50 A / 3P"]
f1l2m = motor [label: "MTR-1133", rating: "24 kW / COMP"]
f2cb = breaker [label: "CB-377", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-799", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-347", rating: "MCCB / 50 A / 3P"]
f2l1drv = vfd [label: "DRV-872", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1135", rating: "22 kW / PROC"]
f3cb = breaker [label: "CB-375", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-712", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1072", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-325", rating: "MCCB / 80 A / 3P"]
f3l1m = motor [label: "MTR-1172", rating: "37 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
