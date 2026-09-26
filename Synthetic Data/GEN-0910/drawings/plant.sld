sld "GEN-0910 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-497", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
txA1 = transformer_yd [label: "TX-1600", rating: "15060 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-355", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-745", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
f1cb = breaker [label: "CB-362", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-733", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
f1pnl = hub [label: "FD-953", rating: "3P+N"]
f1l1ld = load [label: "PNL-1441", rating: "DISTRIBUTION FEEDER / 1139 kW"]
f1l2ld = load [label: "PNL-1427", rating: "DISTRIBUTION FEEDER / 1198 kW"]
f2cb = breaker [label: "CB-352", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-784", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1024", rating: "kW / kWh"]
f2pnl = hub [label: "FD-936", rating: "3P+N"]
f2l1ld = load [label: "PNL-1493", rating: "STATION SERVICE / 148 kW"]
f2l2ld = load [label: "PNL-1446", rating: "DISTRIBUTION FEEDER / 944 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
