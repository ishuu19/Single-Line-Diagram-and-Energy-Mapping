sld "GEN-0298 — RETAIL FACILITY / ELECTRICAL DISTRIBUTION"
# STORE SERVICES SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-441", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1616", rating: "580 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-300", rating: "MCCB / 1600 A / 3P"]
mctA1 = ct [label: "TA-711", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1044", rating: "kW / kWh"]
f1cb = breaker [label: "CB-357", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-738", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1004", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1446", rating: "AUXILIARY PANEL / 24 kW"]
f2cb = breaker [label: "CB-338", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-745", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1003", rating: "kW / kWh"]
f2pnl = hub [label: "FD-932", rating: "3P+N"]
f2l1cb = breaker [label: "CB-377", rating: "MCCB / 63 A / 3P"]
f2l1m = motor [label: "MTR-1109", rating: "15 kW / EF"]
f2l2ld = load [label: "PNL-1451", rating: "SALES FLOOR LIGHTING / 33 kW"]
f3cb = breaker [label: "CB-372", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-769", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
f3pnl = hub [label: "FD-909", rating: "3P+N"]
f3l1cb = breaker [label: "CB-328", rating: "MCCB / 40 A / 3P"]
f3l1m = motor [label: "MTR-1163", rating: "10 kW / EF"]
f3l2ld = load [label: "PNL-1487", rating: "SALES FLOOR LIGHTING / 53 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1m
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1cb
f3l1cb -> f3l1m
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
