sld "GEN-0279 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-454", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1696", rating: "440 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-393", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-734", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
srcA2 = utility [label: "33kV STANDBY", voltage: "33kV"]
txA2 = transformer_dy [label: "TX-1658", rating: "440 kVA", voltage: "33kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-356", rating: "ACB / 630 A / 3P"]
mctA2 = ct [label: "TA-775", rating: "3 CTs / 630/5 A"]
mpmA2 = watthour_meter [label: "PM-1013", rating: "kW / kWh"]
f1cb = breaker [label: "CB-313", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-795", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1066", rating: "kW / kWh"]
f1pnl = hub [label: "FD-984", rating: "3P+N"]
f1l1ld = load [label: "PNL-1438", rating: "CELLAR PANEL / 11 kW"]
f1l2ld = load [label: "PNL-1453", rating: "CELLAR PANEL / 14 kW"]
f2cb = breaker [label: "CB-364", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-768", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1068", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1485", rating: "CELLAR PANEL / 13 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
