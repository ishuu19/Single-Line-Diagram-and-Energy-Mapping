sld "GEN-1267 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-487", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1613", rating: "230 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-352", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-711", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1033", rating: "kW / kWh"]
f1cb = breaker [label: "CB-339", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-722", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1078", rating: "kW / kWh"]
f1pnl = hub [label: "FD-905", rating: "3P+N"]
f1l1ld = load [label: "PNL-1447", rating: "RECTIFIER PDU / 42 kW"]
f1l2ld = load [label: "PNL-1459", rating: "RECTIFIER PDU / 46 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
mctA1 -> mpmA1
f1ct -> f1pm
