sld "GEN-0310 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-403", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1679", rating: "290 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-304", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-783", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
f1cb = breaker [label: "CB-303", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-778", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1011", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1414", rating: "PACKAGING PANEL / 23 kW"]
f2cb = breaker [label: "CB-377", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-728", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
f2pnl = hub [label: "FD-905", rating: "3P+N"]
f2l1cb = breaker [label: "CB-398", rating: "MCCB / 250 A / 3P"]
f2l1m = motor [label: "MTR-1186", rating: "53 kW / COMP"]
f2l2cb = breaker [label: "CB-320", rating: "MCCB / 125 A / 3P"]
f2l2m = motor [label: "MTR-1197", rating: "28 kW / COND"]
f2x = harmonic_filter [label: "HF-507", rating: "5th / 7th"]
f3cb = breaker [label: "CB-374", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-774", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1026", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-391", rating: "MCCB / 100 A / 3P"]
f3l1m = motor [label: "MTR-1115", rating: "23 kW / COND"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1m
f2pnl -> f2l2cb
f2l2cb -> f2l2m
f2pnl -> f2x
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
