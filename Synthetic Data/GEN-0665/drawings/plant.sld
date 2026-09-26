sld "GEN-0665 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-480", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
txA1 = transformer_dy [label: "TX-1687", rating: "15060 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-354", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-745", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1060", rating: "kW / kWh"]
f1cb = breaker [label: "CB-380", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-712", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f1pnl = hub [label: "FD-931", rating: "3P+N"]
f1l1ld = load [label: "PNL-1483", rating: "STATION SERVICE / 150 kW"]
f1l2ld = load [label: "PNL-1447", rating: "STATION SERVICE / 62 kW"]
f2cb = breaker [label: "CB-324", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-720", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1489", rating: "DISTRIBUTION FEEDER / 1069 kW"]
f3cb = breaker [label: "CB-394", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-747", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
f3pnl = hub [label: "FD-920", rating: "3P+N"]
f3l1ld = load [label: "PNL-1457", rating: "DISTRIBUTION FEEDER / 1031 kW"]
f3l2ld = load [label: "PNL-1436", rating: "STATION SERVICE / 65 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
