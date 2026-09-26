sld "GEN-0217 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-499", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1682", rating: "440 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-394", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-731", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
f1cb = breaker [label: "CB-360", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-788", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
f1pnl = hub [label: "FD-929", rating: "3P+N"]
f1l1ld = load [label: "PNL-1446", rating: "CANOPY AUXILIARIES / 29 kW"]
f1l2ld = load [label: "PNL-1461", rating: "DC FAST CHARGER BANK / 81 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
mctA1 -> mpmA1
f1ct -> f1pm
