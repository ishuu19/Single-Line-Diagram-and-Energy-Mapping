sld "GEN-1014 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-435", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
mcbA1 = breaker [label: "CB-342", rating: "MCCB / 400 A / 3P"]
mctA1 = ct [label: "TA-784", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
f1cb = breaker [label: "CB-324", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-740", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1004", rating: "kW / kWh"]
f1pnl = hub [label: "FD-955", rating: "3P+N"]
f1l1cb = breaker [label: "CB-362", rating: "MCCB / 50 A / 3P"]
f1l1m = motor [label: "MTR-1155", rating: "21 kW / COND"]
f1l2cb = breaker [label: "CB-366", rating: "MCCB / 50 A / 3P"]
f1l2m = motor [label: "MTR-1117", rating: "20 kW / COND"]
f2cb = breaker [label: "CB-345", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-780", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1087", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-301", rating: "MCCB / 32 A / 3P"]
f2l1m = motor [label: "MTR-1124", rating: "14 kW / EF"]

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
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
