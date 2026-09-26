sld "GEN-1082 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-463", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
mcbA1 = breaker [label: "CB-329", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-755", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1034", rating: "kW / kWh"]
f1cb = breaker [label: "CB-387", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-748", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
f1pnl = hub [label: "FD-957", rating: "3P+N"]
f1l1cb = breaker [label: "CB-372", rating: "MCCB / 125 A / 3P"]
f1l1m = motor [label: "MTR-1142", rating: "50 kW / COMP"]
f1l2cb = breaker [label: "CB-335", rating: "MCCB / 63 A / 3P"]
f1l2m = motor [label: "MTR-1188", rating: "28 kW / COMP"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2m
mctA1 -> mpmA1
f1ct -> f1pm
