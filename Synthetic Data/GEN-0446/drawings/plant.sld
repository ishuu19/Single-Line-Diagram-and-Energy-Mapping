sld "GEN-0446 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-466", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
txA1 = transformer_dy [label: "TX-1643", rating: "19120 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-396", rating: "MCCB / 800 A / 3P"]
mctA1 = ct [label: "TA-711", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f1cb = breaker [label: "CB-390", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-700", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f1pnl = hub [label: "FD-997", rating: "3P+N"]
f1l1ld = load [label: "PNL-1452", rating: "DISTRIBUTION FEEDER / 742 kW"]
f1l2ld = load [label: "PNL-1475", rating: "STATION SERVICE / 91 kW"]
f2cb = breaker [label: "CB-351", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-731", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1020", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1435", rating: "STATION SERVICE / 136 kW"]
f3cb = breaker [label: "CB-394", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-799", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1057", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1443", rating: "DISTRIBUTION FEEDER / 851 kW"]

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
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
