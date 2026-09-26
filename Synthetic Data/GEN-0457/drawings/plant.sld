sld "GEN-0457 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-426", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
txA1 = transformer_dy [label: "TX-1659", rating: "23900 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-390", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-777", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1022", rating: "kW / kWh"]
f1cb = breaker [label: "CB-381", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-771", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1095", rating: "kW / kWh"]
f1pnl = hub [label: "FD-908", rating: "3P+N"]
f1l1ld = load [label: "PNL-1419", rating: "STATION SERVICE / 142 kW"]
f1l2ld = load [label: "PNL-1427", rating: "STATION SERVICE / 117 kW"]
f2cb = breaker [label: "CB-366", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-764", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1488", rating: "DISTRIBUTION FEEDER / 695 kW"]
f3cb = breaker [label: "CB-315", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-746", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1018", rating: "kW / kWh"]
f3pnl = hub [label: "FD-962", rating: "3P+N"]
f3l1ld = load [label: "PNL-1470", rating: "DISTRIBUTION FEEDER / 1132 kW"]
f3l2ld = load [label: "PNL-1429", rating: "DISTRIBUTION FEEDER / 979 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
