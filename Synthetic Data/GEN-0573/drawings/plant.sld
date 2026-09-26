sld "GEN-0573 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-427", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
mcbA1 = breaker [label: "CB-307", rating: "MCCB / 2000 A / 3P"]
mctA1 = ct [label: "TA-743", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1060", rating: "kW / kWh"]
f1cb = breaker [label: "CB-371", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-793", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1073", rating: "kW / kWh"]
f1pnl = hub [label: "FD-999", rating: "3P+N"]
f1l1cb = breaker [label: "CB-389", rating: "MCCB / 40 A / 3P"]
f1l1m = motor [label: "MTR-1177", rating: "22 kW / EF"]
f1l2ld = load [label: "PNL-1441", rating: "TENANT PANEL / 110 kW"]
f2cb = breaker [label: "CB-329", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-788", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1094", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-364", rating: "MCCB / 40 A / 3P"]
f2l1m = motor [label: "MTR-1151", rating: "22 kW / EF"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
