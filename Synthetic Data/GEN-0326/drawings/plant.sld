sld "GEN-0326 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-470", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
mcbA1 = breaker [label: "CB-304", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-780", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1058", rating: "kW / kWh"]
f1cb = breaker [label: "CB-370", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-713", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1030", rating: "kW / kWh"]
f1pnl = hub [label: "FD-979", rating: "3P+N"]
f1l1ld = load [label: "PNL-1440", rating: "SHOP AUXILIARIES / 23 kW"]
f1l2cb = breaker [label: "CB-337", rating: "MCCB / 63 A / 3P"]
f1l2m = motor [label: "MTR-1138", rating: "28 kW / COMP"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2m
mctA1 -> mpmA1
f1ct -> f1pm
