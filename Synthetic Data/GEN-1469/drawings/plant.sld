sld "GEN-1469 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-427", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
laA1 = surge_arrester [label: "LA-1250", voltage: "138kV"]
mcbA1 = breaker [label: "CB-399", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-783", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1044", rating: "kW / kWh"]
f1cb = breaker [label: "CB-323", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-730", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1014", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1402", rating: "DISTRIBUTION FEEDER / 610 kW"]
f2cb = breaker [label: "CB-370", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-727", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1016", rating: "kW / kWh"]
f2pnl = hub [label: "FD-937", rating: "3P+N"]
f2l1ld = load [label: "PNL-1475", rating: "DISTRIBUTION FEEDER / 547 kW"]
f2l2ld = load [label: "PNL-1497", rating: "DISTRIBUTION FEEDER / 631 kW"]
f3cb = breaker [label: "CB-384", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-763", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1048", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1416", rating: "DISTRIBUTION FEEDER / 864 kW"]

srcA1 -> laA1
srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4/0 AWG"]
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
