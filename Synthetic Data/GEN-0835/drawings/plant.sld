sld "GEN-0835 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-401", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
txA1 = transformer_yd [label: "TX-1618", rating: "38240 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-333", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-704", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
f1cb = breaker [label: "CB-394", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-711", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1067", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1420", rating: "STATION SERVICE / 101 kW"]
f2cb = breaker [label: "CB-314", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-785", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1499", rating: "DISTRIBUTION FEEDER / 586 kW"]
f3cb = breaker [label: "CB-370", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-775", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1051", rating: "kW / kWh"]
f3pnl = hub [label: "FD-938", rating: "3P+N"]
f3l1ld = load [label: "PNL-1477", rating: "STATION SERVICE / 79 kW"]
f3l2ld = load [label: "PNL-1459", rating: "STATION SERVICE / 133 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
