sld "GEN-0695 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-440", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
mcbA1 = breaker [label: "CB-322", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-797", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
busB = bus [label: "BUS-462", voltage: "208Y/120V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "208Y/120V", rating: "520 kW"]
mcbB1 = breaker [label: "CB-347", rating: "ACB / 1600 A / 3P"]
mctB1 = ct [label: "TA-715", rating: "3 CTs / 1600/5 A"]
mpmB1 = watthour_meter [label: "PM-1087", rating: "kW / kWh"]
tie = ats [label: "CB-339", rating: "1000 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-358", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-700", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1408", rating: "PACKAGING PANEL / 12 kW"]
f2cb = breaker [label: "CB-389", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-735", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1432", rating: "AUXILIARY PANEL / 39 kW"]
f3cb = breaker [label: "CB-312", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-798", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1090", rating: "kW / kWh"]
f3pnl = hub [label: "FD-977", rating: "3P+N"]
f3l1ld = load [label: "PNL-1443", rating: "AUXILIARY PANEL / 35 kW"]
f3l2ld = load [label: "PNL-1433", rating: "PACKAGING PANEL / 19 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
