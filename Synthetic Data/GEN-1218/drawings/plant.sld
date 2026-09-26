sld "GEN-1218 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-459", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
mcbA1 = breaker [label: "CB-394", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-755", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1040", rating: "kW / kWh"]
f1cb = breaker [label: "CB-361", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-757", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
f1pnl = hub [label: "FD-933", rating: "3P+N"]
f1l1cb = breaker [label: "CB-388", rating: "MCCB / 100 A / 3P"]
f1l1m = motor [label: "MTR-1117", rating: "21 kW / COND"]
f1l2cb = breaker [label: "CB-373", rating: "MCCB / 125 A / 3P"]
f1l2m = motor [label: "MTR-1100", rating: "31 kW / COND"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2m
mctA1 -> mpmA1
f1ct -> f1pm
