sld "GEN-0483 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-467", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
txA1 = transformer_yd [label: "TX-1688", rating: "5980 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-397", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-772", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
f1cb = breaker [label: "CB-321", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-793", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1461", rating: "STATION SERVICE / 90 kW"]
f2cb = breaker [label: "CB-301", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-730", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1026", rating: "kW / kWh"]
f2pnl = hub [label: "FD-920", rating: "3P+N"]
f2l1ld = load [label: "PNL-1475", rating: "DISTRIBUTION FEEDER / 619 kW"]
f2l2ld = load [label: "PNL-1448", rating: "DISTRIBUTION FEEDER / 423 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
