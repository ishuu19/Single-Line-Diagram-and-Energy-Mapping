sld "GEN-0539 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-484", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
txA1 = transformer_dy [label: "TX-1629", rating: "15060 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-322", rating: "MCCB / 630 A / 3P"]
mctA1 = ct [label: "TA-788", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1088", rating: "kW / kWh"]
f1cb = breaker [label: "CB-387", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-746", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1079", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1404", rating: "STATION SERVICE / 99 kW"]
f2cb = breaker [label: "CB-347", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-784", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1094", rating: "kW / kWh"]
f2pnl = hub [label: "FD-963", rating: "3P+N"]
f2l1ld = load [label: "PNL-1450", rating: "STATION SERVICE / 107 kW"]
f2l2ld = load [label: "PNL-1491", rating: "DISTRIBUTION FEEDER / 698 kW"]
f3cb = breaker [label: "CB-386", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-736", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1014", rating: "kW / kWh"]
f3pnl = hub [label: "FD-947", rating: "3P+N"]
f3l1ld = load [label: "PNL-1493", rating: "STATION SERVICE / 123 kW"]
f3l2ld = load [label: "PNL-1471", rating: "DISTRIBUTION FEEDER / 1063 kW"]

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
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
