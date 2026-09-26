sld "GEN-0931 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-499", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1684", rating: "690 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-346", rating: "MCCB / 1000 A / 3P"]
mctA1 = ct [label: "TA-795", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1026", rating: "kW / kWh"]
f1cb = breaker [label: "CB-355", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-710", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1043", rating: "kW / kWh"]
f1pnl = hub [label: "FD-973", rating: "3P+N"]
f1l1cb = breaker [label: "CB-368", rating: "MCCB / 25 A / 3P"]
f1l1m = motor [label: "MTR-1102", rating: "10 kW / EF"]
f1l2cb = breaker [label: "CB-374", rating: "MCCB / 50 A / 3P"]
f1l2m = motor [label: "MTR-1180", rating: "24 kW / COMP"]
f2cb = breaker [label: "CB-398", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-738", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1414", rating: "UTILITY PANEL / 26 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
