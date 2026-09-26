sld "GEN-0842 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-480", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
laA1 = surge_arrester [label: "LA-1208", voltage: "138kV"]
txA1 = transformer_yd [label: "TX-1663", rating: "38240 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-395", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-763", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1029", rating: "kW / kWh"]
f1cb = breaker [label: "CB-374", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-797", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
f1pnl = hub [label: "FD-996", rating: "3P+N"]
f1l1ld = load [label: "PNL-1486", rating: "DISTRIBUTION FEEDER / 613 kW"]
f1l2ld = load [label: "PNL-1485", rating: "STATION SERVICE / 121 kW"]

srcA1 -> laA1
srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
mctA1 -> mpmA1
f1ct -> f1pm
