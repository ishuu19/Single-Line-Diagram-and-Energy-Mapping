sld "GEN-1303 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-495", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
laA1 = surge_arrester [label: "LA-1274", voltage: "138kV"]
txA1 = transformer_dy [label: "TX-1669", rating: "47800 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-361", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-709", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1078", rating: "kW / kWh"]
f1cb = breaker [label: "CB-340", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-794", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1046", rating: "kW / kWh"]
f1pnl = hub [label: "FD-905", rating: "3P+N"]
f1l1ld = load [label: "PNL-1473", rating: "STATION SERVICE / 60 kW"]
f1l2ld = load [label: "PNL-1403", rating: "DISTRIBUTION FEEDER / 521 kW"]
f2cb = breaker [label: "CB-391", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-746", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1401", rating: "STATION SERVICE / 136 kW"]
f3cb = breaker [label: "CB-348", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-789", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1488", rating: "STATION SERVICE / 65 kW"]

srcA1 -> laA1
srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
