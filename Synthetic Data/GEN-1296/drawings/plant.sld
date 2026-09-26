sld "GEN-1296 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-468", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
txA1 = transformer_dy [label: "TX-1691", rating: "15060 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-394", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-749", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1072", rating: "kW / kWh"]
f1cb = breaker [label: "CB-312", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-784", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1095", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1418", rating: "DISTRIBUTION FEEDER / 450 kW"]
f2cb = breaker [label: "CB-389", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-772", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1039", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1426", rating: "STATION SERVICE / 112 kW"]
f3cb = breaker [label: "CB-322", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-707", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1021", rating: "kW / kWh"]
f3pr = fuse [label: "CB-362", rating: "100 A"]
f3pnl = hub [label: "FD-967", rating: "3P+N"]
f3l1ld = load [label: "PNL-1488", rating: "DISTRIBUTION FEEDER / 404 kW"]
f3l2ld = load [label: "PNL-1464", rating: "STATION SERVICE / 73 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3pr
f3pr -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
