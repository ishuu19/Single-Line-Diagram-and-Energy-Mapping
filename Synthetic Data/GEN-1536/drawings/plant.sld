sld "GEN-1536 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-481", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
txA1 = transformer_yd [label: "TX-1663", rating: "47800 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-387", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-789", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1036", rating: "kW / kWh"]
f1cb = breaker [label: "CB-391", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-796", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1053", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1443", rating: "DISTRIBUTION FEEDER / 527 kW"]
f2cb = breaker [label: "CB-382", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-784", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1033", rating: "kW / kWh"]
f2pnl = hub [label: "FD-956", rating: "3P+N"]
f2l1ld = load [label: "PNL-1402", rating: "STATION SERVICE / 124 kW"]
f2l2ld = load [label: "PNL-1401", rating: "DISTRIBUTION FEEDER / 528 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
