sld "GEN-0703 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-443", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
mcbA1 = breaker [label: "CB-350", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-746", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1038", rating: "kW / kWh"]
f1cb = breaker [label: "CB-302", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-794", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1088", rating: "kW / kWh"]
f1pnl = hub [label: "FD-993", rating: "3P+N"]
f1l1ld = load [label: "PNL-1439", rating: "LIFE SAFETY BRANCH / 60 kW"]
f1l2ld = load [label: "PNL-1424", rating: "CRITICAL BRANCH / 40 kW"]

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
