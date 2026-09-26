sld "GEN-0046 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-427", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
mcbA1 = breaker [label: "CB-391", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-725", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1003", rating: "kW / kWh"]
f1cb = breaker [label: "CB-338", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-776", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
f1pnl = hub [label: "FD-985", rating: "3P+N"]
f1l1ld = load [label: "PNL-1411", rating: "DOCK LIGHTING / 18 kW"]
f1l2cb = breaker [label: "CB-394", rating: "MCCB / 25 A / 3P"]
f1l2m = motor [label: "MTR-1110", rating: "6 kW / EF"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2m
mctA1 -> mpmA1
f1ct -> f1pm
