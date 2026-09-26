sld "GEN-1080 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-453", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
mcbA1 = breaker [label: "CB-337", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-751", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1072", rating: "kW / kWh"]
f1cb = breaker [label: "CB-391", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-722", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1042", rating: "kW / kWh"]
f1pnl = hub [label: "FD-901", rating: "3P+N"]
f1l1ld = load [label: "PNL-1474", rating: "CRITICAL BRANCH / 67 kW"]
f1l2ld = load [label: "PNL-1455", rating: "WARD LIGHTING / 44 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
mctA1 -> mpmA1
f1ct -> f1pm
