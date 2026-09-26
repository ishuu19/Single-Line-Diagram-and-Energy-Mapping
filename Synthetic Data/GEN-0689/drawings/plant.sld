sld "GEN-0689 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-465", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
mcbA1 = breaker [label: "CB-339", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-779", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1088", rating: "kW / kWh"]
f1cb = breaker [label: "CB-314", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-706", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
f1pnl = hub [label: "FD-933", rating: "3P+N"]
f1l1ld = load [label: "PNL-1413", rating: "SHORE POWER PANEL / 56 kW"]
f1l2cb = breaker [label: "CB-350", rating: "MCCB / 25 A / 3P"]
f1l2m = motor [label: "MTR-1155", rating: "10 kW / EF"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2m
mctA1 -> mpmA1
f1ct -> f1pm
