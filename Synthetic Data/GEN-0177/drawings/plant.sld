sld "GEN-0177 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-456", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
mcbA1 = breaker [label: "CB-326", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-711", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
f1cb = breaker [label: "CB-307", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-733", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1017", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1449", rating: "DISTRIBUTION FEEDER / 698 kW"]
f2cb = breaker [label: "CB-384", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-798", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1050", rating: "kW / kWh"]
f2pnl = hub [label: "FD-919", rating: "3P+N"]
f2l1ld = load [label: "PNL-1442", rating: "DISTRIBUTION FEEDER / 762 kW"]
f2l2ld = load [label: "PNL-1400", rating: "STATION SERVICE / 129 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
