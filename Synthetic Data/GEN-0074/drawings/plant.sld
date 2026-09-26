sld "GEN-0074 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-418", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
mcbA1 = breaker [label: "CB-344", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-778", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1024", rating: "kW / kWh"]
f1cb = breaker [label: "CB-310", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-729", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1063", rating: "kW / kWh"]
f1pnl = hub [label: "FD-998", rating: "3P+N"]
f1l1ld = load [label: "PNL-1417", rating: "FLOOR LIGHTING / 83 kW"]
f1l2cb = breaker [label: "CB-394", rating: "MCCB / 50 A / 3P"]
f1l2m = motor [label: "MTR-1134", rating: "12 kW / EF"]

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
