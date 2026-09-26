sld "GEN-0431 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-488", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
txA1 = transformer_dy [label: "TX-1617", rating: "23900 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-316", rating: "MCCB / 1000 A / 3P"]
mctA1 = ct [label: "TA-738", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1022", rating: "kW / kWh"]
f1cb = breaker [label: "CB-393", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-790", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1013", rating: "kW / kWh"]
f1pnl = hub [label: "FD-997", rating: "3P+N"]
f1l1ld = load [label: "PNL-1427", rating: "STATION SERVICE / 100 kW"]
f1l2ld = load [label: "PNL-1497", rating: "STATION SERVICE / 106 kW"]

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
