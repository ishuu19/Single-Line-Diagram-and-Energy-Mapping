sld "GEN-1018 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-458", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
mcbA1 = breaker [label: "CB-353", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-711", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1078", rating: "kW / kWh"]
f1cb = breaker [label: "CB-372", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-721", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1069", rating: "kW / kWh"]
f1pnl = hub [label: "FD-919", rating: "3P+N"]
f1l1ld = load [label: "PNL-1425", rating: "AUXILIARY PANEL / 35 kW"]
f1l2cb = breaker [label: "CB-305", rating: "MCCB / 50 A / 3P"]
f1l2m = motor [label: "MTR-1117", rating: "23 kW / COMP"]
f2cb = breaker [label: "CB-301", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-797", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f2pnl = hub [label: "FD-970", rating: "3P+N"]
f2l1cb = breaker [label: "CB-394", rating: "MCCB / 63 A / 3P"]
f2l1m = motor [label: "MTR-1103", rating: "28 kW / COMP"]
f2l2ld = load [label: "PNL-1446", rating: "UTILITY PANEL / 22 kW"]
f3cb = breaker [label: "CB-380", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-702", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1019", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-322", rating: "MCCB / 40 A / 3P"]
f3l1m = motor [label: "MTR-1135", rating: "18 kW / COMP"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1m
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
