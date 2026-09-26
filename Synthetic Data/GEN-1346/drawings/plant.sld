sld "GEN-1346 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-438", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1647", rating: "670 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-391", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-725", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1036", rating: "kW / kWh"]
f1cb = breaker [label: "CB-354", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-707", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
f1pnl = hub [label: "FD-910", rating: "3P+N"]
f1l1ld = load [label: "PNL-1429", rating: "AUXILIARY PANEL / 39 kW"]
f1l2cb = breaker [label: "CB-395", rating: "MCCB / 80 A / 3P"]
f1l2drv = vfd [label: "DRV-851", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1131", rating: "41 kW / BLOW"]
f2cb = breaker [label: "CB-383", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-744", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1040", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-371", rating: "MCCB / 40 A / 3P"]
f2l1drv = vfd [label: "DRV-887", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1105", rating: "20 kW / BLOW"]
f3cb = breaker [label: "CB-342", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-732", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1056", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1480", rating: "DOSING PANEL / 37 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
