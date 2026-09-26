sld "GEN-0158 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-412", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
txA1 = transformer_dy [label: "TX-1633", rating: "15060 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-360", rating: "MCCB / 630 A / 3P"]
mctA1 = ct [label: "TA-719", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1087", rating: "kW / kWh"]
f1cb = breaker [label: "CB-398", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-711", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1069", rating: "kW / kWh"]
f1pnl = hub [label: "FD-909", rating: "3P+N"]
f1l1ld = load [label: "PNL-1409", rating: "STATION SERVICE / 123 kW"]
f1l2ld = load [label: "PNL-1416", rating: "STATION SERVICE / 136 kW"]
f2cb = breaker [label: "CB-366", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-733", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1490", rating: "DISTRIBUTION FEEDER / 480 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
