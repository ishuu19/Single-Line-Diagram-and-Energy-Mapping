sld "GEN-1481 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-430", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
laA1 = surge_arrester [label: "LA-1232", voltage: "138kV"]
txA1 = transformer_dy [label: "TX-1698", rating: "5980 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-376", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-773", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
f1cb = breaker [label: "CB-336", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-736", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1018", rating: "kW / kWh"]
f1pnl = hub [label: "FD-944", rating: "3P+N"]
f1l1ld = load [label: "PNL-1493", rating: "STATION SERVICE / 83 kW"]
f1l2ld = load [label: "PNL-1429", rating: "DISTRIBUTION FEEDER / 995 kW"]
f2cb = breaker [label: "CB-343", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-772", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1069", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1440", rating: "STATION SERVICE / 132 kW"]
f3cb = breaker [label: "CB-360", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-752", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
f3pnl = hub [label: "FD-987", rating: "3P+N"]
f3l1ld = load [label: "PNL-1498", rating: "STATION SERVICE / 124 kW"]
f3l2ld = load [label: "PNL-1436", rating: "STATION SERVICE / 110 kW"]

srcA1 -> laA1
srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
