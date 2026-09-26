sld "GEN-1443 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-456", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
txA1 = transformer_dy [label: "TX-1648", rating: "23900 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-301", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-777", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
f1cb = breaker [label: "CB-384", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-730", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1058", rating: "kW / kWh"]
f1pnl = hub [label: "FD-983", rating: "3P+N"]
f1l1ld = load [label: "PNL-1468", rating: "STATION SERVICE / 78 kW"]
f1l2ld = load [label: "PNL-1474", rating: "DISTRIBUTION FEEDER / 543 kW"]
f2cb = breaker [label: "CB-331", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-766", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1062", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1403", rating: "STATION SERVICE / 88 kW"]
f3cb = breaker [label: "CB-380", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-743", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1076", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1493", rating: "STATION SERVICE / 112 kW"]

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
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
