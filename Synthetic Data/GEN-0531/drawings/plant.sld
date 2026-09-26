sld "GEN-0531 — RETAIL FACILITY / ELECTRICAL DISTRIBUTION"
# STORE SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-482", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
mcbA1 = breaker [label: "CB-318", rating: "MCCB / 1600 A / 3P"]
mctA1 = ct [label: "TA-741", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1021", rating: "kW / kWh"]
f1cb = breaker [label: "CB-362", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-723", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1000", rating: "kW / kWh"]
f1pnl = hub [label: "FD-904", rating: "3P+N"]
f1l1cb = breaker [label: "CB-398", rating: "MCCB / 16 A / 3P"]
f1l1m = motor [label: "MTR-1136", rating: "7 kW / EF"]
f1l2cb = breaker [label: "CB-331", rating: "MCCB / 32 A / 3P"]
f1l2m = motor [label: "MTR-1192", rating: "14 kW / EF"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2m
mctA1 -> mpmA1
f1ct -> f1pm
