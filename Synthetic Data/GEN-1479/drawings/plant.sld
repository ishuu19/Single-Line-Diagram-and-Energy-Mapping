sld "GEN-1479 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-405", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
txA1 = transformer_yd [label: "TX-1671", rating: "5980 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-309", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-741", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1056", rating: "kW / kWh"]
f1cb = breaker [label: "CB-372", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-740", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1077", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1432", rating: "STATION SERVICE / 82 kW"]
f2cb = breaker [label: "CB-335", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-733", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1032", rating: "kW / kWh"]
f2pnl = hub [label: "FD-930", rating: "3P+N"]
f2l1ld = load [label: "PNL-1491", rating: "DISTRIBUTION FEEDER / 1172 kW"]
f2l2ld = load [label: "PNL-1455", rating: "STATION SERVICE / 61 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
