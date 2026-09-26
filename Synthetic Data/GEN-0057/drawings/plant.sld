sld "GEN-0057 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-473", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1640", rating: "90 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-391", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-768", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1026", rating: "kW / kWh"]
f1cb = breaker [label: "CB-324", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-740", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1053", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-301", rating: "MCCB / 32 A / 3P"]
f1l1m = motor [label: "MTR-1111", rating: "8 kW / EF"]
f2cb = breaker [label: "CB-357", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-755", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
f2pnl = hub [label: "FD-916", rating: "3P+N"]
f2l1ld = load [label: "PNL-1449", rating: "DOCK LIGHTING / 25 kW"]
f2l2cb = breaker [label: "CB-317", rating: "MCCB / 32 A / 3P"]
f2l2m = motor [label: "MTR-1121", rating: "8 kW / EF"]
f3cb = breaker [label: "CB-350", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-792", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
f3pnl = hub [label: "FD-940", rating: "3P+N"]
f3l1ld = load [label: "PNL-1439", rating: "DOCK LIGHTING / 20 kW"]
f3l2ld = load [label: "PNL-1481", rating: "DOCK LIGHTING / 19 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
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
