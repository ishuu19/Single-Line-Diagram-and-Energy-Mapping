sld "GEN-0698 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-452", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
mcbA1 = breaker [label: "CB-306", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-747", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
f1cb = breaker [label: "CB-379", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-741", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1017", rating: "kW / kWh"]
f1pnl = hub [label: "FD-964", rating: "3P+N"]
f1l1ld = load [label: "PNL-1430", rating: "SHOP LIGHTING / 23 kW"]
f1l2cb = breaker [label: "CB-320", rating: "MCCB / 80 A / 3P"]
f1l2m = motor [label: "MTR-1109", rating: "38 kW / COMP"]

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
