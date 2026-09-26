sld "GEN-0033 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-472", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
mcbA1 = breaker [label: "CB-347", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-775", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f1cb = breaker [label: "CB-336", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-778", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1031", rating: "kW / kWh"]
f1pnl = hub [label: "FD-994", rating: "3P+N"]
f1l1ld = load [label: "PNL-1491", rating: "COMMON AREA LIGHTING / 55 kW"]
f1l2ld = load [label: "PNL-1483", rating: "RISER PANEL / 63 kW"]

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
