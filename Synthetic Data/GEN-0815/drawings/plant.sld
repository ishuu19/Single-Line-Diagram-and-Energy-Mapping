sld "GEN-0815 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-430", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
mcbA1 = breaker [label: "CB-310", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-708", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1089", rating: "kW / kWh"]
f1cb = breaker [label: "CB-346", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-731", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
f1pnl = hub [label: "FD-925", rating: "3P+N"]
f1l1cb = breaker [label: "CB-324", rating: "MCCB / 50 A / 3P"]
f1l1m = motor [label: "MTR-1195", rating: "28 kW / RWP"]
f1l2ld = load [label: "PNL-1417", rating: "GROW LIGHTING / 36 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2ld
mctA1 -> mpmA1
f1ct -> f1pm
