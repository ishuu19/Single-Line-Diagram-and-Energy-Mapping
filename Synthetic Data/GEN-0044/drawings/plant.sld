sld "GEN-0044 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-446", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1600", rating: "90 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-369", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-740", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
f1cb = breaker [label: "CB-335", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-717", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1050", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-367", rating: "MCCB / 63 A / 3P"]
f1l1m = motor [label: "MTR-1129", rating: "14 kW / EF"]
f2cb = breaker [label: "CB-336", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-709", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1046", rating: "kW / kWh"]
f2pnl = hub [label: "FD-945", rating: "3P+N"]
f2l1cb = breaker [label: "CB-378", rating: "MCCB / 50 A / 3P"]
f2l1m = motor [label: "MTR-1127", rating: "12 kW / EF"]
f2l2cb = breaker [label: "CB-377", rating: "MCCB / 40 A / 3P"]
f2l2m = motor [label: "MTR-1151", rating: "9 kW / EF"]
f3cb = breaker [label: "CB-366", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-761", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f3pnl = hub [label: "FD-985", rating: "3P+N"]
f3l1ld = load [label: "PNL-1439", rating: "AUXILIARY PANEL / 22 kW"]
f3l2ld = load [label: "PNL-1473", rating: "RISER PANEL / 48 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1m
f2pnl -> f2l2cb
f2l2cb -> f2l2m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
