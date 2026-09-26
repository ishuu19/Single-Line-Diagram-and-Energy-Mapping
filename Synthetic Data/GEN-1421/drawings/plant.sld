sld "GEN-1421 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-451", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1659", rating: "1390 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-391", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-758", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1042", rating: "kW / kWh"]
f1cb = breaker [label: "CB-379", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-737", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1000", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1448", rating: "CELLAR PANEL / 16 kW"]
f2cb = breaker [label: "CB-360", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-736", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f2pnl = hub [label: "FD-931", rating: "3P+N"]
f2l1ld = load [label: "PNL-1467", rating: "CELLAR PANEL / 13 kW"]
f2l2ld = load [label: "PNL-1428", rating: "CELLAR PANEL / 10 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
