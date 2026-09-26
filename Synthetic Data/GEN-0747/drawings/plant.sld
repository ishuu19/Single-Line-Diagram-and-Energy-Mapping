sld "GEN-0747 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-491", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1626", rating: "90 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-302", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-738", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1007", rating: "kW / kWh"]
f1cb = breaker [label: "CB-382", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-749", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
f1pnl = hub [label: "FD-978", rating: "3P+N"]
f1l1cb = breaker [label: "CB-350", rating: "MCCB / 160 A / 3P"]
f1l1m = motor [label: "MTR-1107", rating: "34 kW / COMP"]
f1l2ld = load [label: "PNL-1442", rating: "AUXILIARY PANEL / 53 kW"]
f2cb = breaker [label: "CB-365", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-761", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1467", rating: "PACKAGING PANEL / 21 kW"]
f3cb = breaker [label: "CB-353", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-725", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1000", rating: "kW / kWh"]
f3pnl = hub [label: "FD-915", rating: "3P+N"]
f3l1cb = breaker [label: "CB-390", rating: "MCCB / 250 A / 3P"]
f3l1m = motor [label: "MTR-1176", rating: "55 kW / COMP"]
f3l2ld = load [label: "PNL-1421", rating: "PACKAGING PANEL / 22 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
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
