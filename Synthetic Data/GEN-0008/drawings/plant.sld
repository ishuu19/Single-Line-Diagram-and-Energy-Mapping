sld "GEN-0008 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-484", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
laA1 = surge_arrester [label: "LA-1293", voltage: "138kV"]
txA1 = transformer_dy [label: "TX-1692", rating: "47800 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-381", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-759", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1056", rating: "kW / kWh"]
f1cb = breaker [label: "CB-309", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-745", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1036", rating: "kW / kWh"]
f1pr = recloser [label: "CB-331", rating: "63 A"]
f1l1ld = load [label: "PNL-1436", rating: "STATION SERVICE / 143 kW"]
f2cb = breaker [label: "CB-321", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-722", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1488", rating: "DISTRIBUTION FEEDER / 988 kW"]
f3cb = breaker [label: "CB-384", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-774", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
f3pr = fuse [label: "CB-366", rating: "250 A"]
f3pnl = hub [label: "FD-924", rating: "3P+N"]
f3l1ld = load [label: "PNL-1495", rating: "STATION SERVICE / 95 kW"]
f3l2ld = load [label: "PNL-1449", rating: "DISTRIBUTION FEEDER / 1046 kW"]

srcA1 -> laA1
srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pr
f1pr -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3pr
f3pr -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
