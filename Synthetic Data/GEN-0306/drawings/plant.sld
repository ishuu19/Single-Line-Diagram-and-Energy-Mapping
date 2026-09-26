sld "GEN-0306 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-458", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
mcbA1 = breaker [label: "CB-312", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-773", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
f1cb = breaker [label: "CB-303", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-752", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1041", rating: "kW / kWh"]
f1pnl = hub [label: "FD-954", rating: "3P+N"]
f1l1cb = breaker [label: "CB-316", rating: "MCCB / 20 A / 3P"]
f1l1m = motor [label: "MTR-1173", rating: "9 kW / EF"]
f1l2cb = breaker [label: "CB-337", rating: "MCCB / 32 A / 3P"]
f1l2m = motor [label: "MTR-1100", rating: "15 kW / EF"]

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
