sld "GEN-0390 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-471", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
txA1 = transformer_yd [label: "TX-1629", rating: "47800 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-362", rating: "MCCB / 2000 A / 3P"]
mctA1 = ct [label: "TA-728", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
f1cb = breaker [label: "CB-356", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-791", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1038", rating: "kW / kWh"]
f1pnl = hub [label: "FD-934", rating: "3P+N"]
f1l1ld = load [label: "PNL-1446", rating: "DISTRIBUTION FEEDER / 1136 kW"]
f1l2ld = load [label: "PNL-1470", rating: "STATION SERVICE / 124 kW"]
f2cb = breaker [label: "CB-398", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-735", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1036", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1435", rating: "STATION SERVICE / 84 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
