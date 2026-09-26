sld "GEN-0901 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-469", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
txA1 = transformer_dy [label: "TX-1628", rating: "19120 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-326", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-758", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1057", rating: "kW / kWh"]
f1cb = breaker [label: "CB-379", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-780", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1060", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1492", rating: "STATION SERVICE / 60 kW"]
f2cb = breaker [label: "CB-340", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-779", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1031", rating: "kW / kWh"]
f2pnl = hub [label: "FD-943", rating: "3P+N"]
f2l1ld = load [label: "PNL-1484", rating: "STATION SERVICE / 117 kW"]
f2l2ld = load [label: "PNL-1429", rating: "STATION SERVICE / 99 kW"]
f3cb = breaker [label: "CB-364", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-708", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1038", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1457", rating: "STATION SERVICE / 87 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
