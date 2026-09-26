sld "GEN-0475 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-465", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1672", rating: "550 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-328", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-755", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1097", rating: "kW / kWh"]
f1cb = breaker [label: "CB-366", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-794", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1018", rating: "kW / kWh"]
f1pnl = hub [label: "FD-942", rating: "3P+N"]
f1l1cb = breaker [label: "CB-365", rating: "MCCB / 80 A / 3P"]
f1l1m = motor [label: "MTR-1192", rating: "33 kW / COMP"]
f1l2ld = load [label: "PNL-1494", rating: "UTILITY PANEL / 23 kW"]
f2cb = breaker [label: "CB-356", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-707", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1067", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-316", rating: "MCCB / 63 A / 3P"]
f2l1m = motor [label: "MTR-1161", rating: "28 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
