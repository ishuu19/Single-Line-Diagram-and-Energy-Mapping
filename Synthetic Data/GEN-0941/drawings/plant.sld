sld "GEN-0941 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-487", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
txA1 = transformer_yd [label: "TX-1672", rating: "19120 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-381", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-763", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1047", rating: "kW / kWh"]
f1cb = breaker [label: "CB-309", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-729", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f1pnl = hub [label: "FD-999", rating: "3P+N"]
f1l1ld = load [label: "PNL-1466", rating: "STATION SERVICE / 63 kW"]
f1l2ld = load [label: "PNL-1428", rating: "STATION SERVICE / 107 kW"]

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
