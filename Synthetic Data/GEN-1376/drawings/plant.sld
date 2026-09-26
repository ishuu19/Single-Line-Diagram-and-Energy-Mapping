sld "GEN-1376 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-432", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
txA1 = transformer_dy [label: "TX-1618", rating: "47800 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-345", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-713", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
f1cb = breaker [label: "CB-319", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-789", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1037", rating: "kW / kWh"]
f1pnl = hub [label: "FD-933", rating: "3P+N"]
f1l1ld = load [label: "PNL-1461", rating: "STATION SERVICE / 87 kW"]
f1l2ld = load [label: "PNL-1425", rating: "STATION SERVICE / 79 kW"]
f2cb = breaker [label: "CB-381", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-709", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1036", rating: "kW / kWh"]
f2pnl = hub [label: "FD-955", rating: "3P+N"]
f2l1ld = load [label: "PNL-1436", rating: "STATION SERVICE / 70 kW"]
f2l2ld = load [label: "PNL-1496", rating: "STATION SERVICE / 95 kW"]
f3cb = breaker [label: "CB-322", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-721", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1407", rating: "DISTRIBUTION FEEDER / 471 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
