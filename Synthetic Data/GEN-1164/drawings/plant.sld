sld "GEN-1164 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-455", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
txA1 = transformer_yd [label: "TX-1628", rating: "38240 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-392", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-710", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
f1cb = breaker [label: "CB-388", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-768", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1033", rating: "kW / kWh"]
f1pr = recloser [label: "CB-324", rating: "400 A"]
f1pnl = hub [label: "FD-900", rating: "3P+N"]
f1l1ld = load [label: "PNL-1412", rating: "DISTRIBUTION FEEDER / 1091 kW"]
f1l2ld = load [label: "PNL-1476", rating: "STATION SERVICE / 106 kW"]
f2cb = breaker [label: "CB-344", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-760", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1057", rating: "kW / kWh"]
f2pnl = hub [label: "FD-997", rating: "3P+N"]
f2l1ld = load [label: "PNL-1425", rating: "STATION SERVICE / 86 kW"]
f2l2ld = load [label: "PNL-1442", rating: "DISTRIBUTION FEEDER / 433 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1pr
f1pr -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
