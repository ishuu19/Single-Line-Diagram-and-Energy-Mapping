sld "GEN-0566 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-421", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1628", rating: "690 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-394", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-709", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1029", rating: "kW / kWh"]
f1cb = breaker [label: "CB-354", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-710", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-387", rating: "MCCB / 80 A / 3P"]
f1l1m = motor [label: "MTR-1150", rating: "32 kW / COND"]
f2cb = breaker [label: "CB-350", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-721", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1081", rating: "kW / kWh"]
f2pnl = hub [label: "FD-961", rating: "3P+N"]
f2l1cb = breaker [label: "CB-360", rating: "MCCB / 16 A / 3P"]
f2l1m = motor [label: "MTR-1158", rating: "6 kW / EF"]
f2l2cb = breaker [label: "CB-348", rating: "MCCB / 25 A / 3P"]
f2l2m = motor [label: "MTR-1144", rating: "10 kW / EF"]
f3cb = breaker [label: "CB-397", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-778", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
f3pnl = hub [label: "FD-968", rating: "3P+N"]
f3l1ld = load [label: "PNL-1489", rating: "DOCK PANEL / 21 kW"]
f3l2ld = load [label: "PNL-1446", rating: "DOCK PANEL / 22 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
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
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
