sld "GEN-0061 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-485", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1666", rating: "520 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-370", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-766", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
f1cb = breaker [label: "CB-387", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-784", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1419", rating: "CANOPY AUXILIARIES / 31 kW"]
f2cb = breaker [label: "CB-322", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-704", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f2pnl = hub [label: "FD-946", rating: "3P+N"]
f2l1ld = load [label: "PNL-1477", rating: "FORECOURT LIGHTING / 12 kW"]
f2l2ld = load [label: "PNL-1451", rating: "CANOPY AUXILIARIES / 15 kW"]
f3cb = breaker [label: "CB-359", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-769", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1068", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1421", rating: "DC FAST CHARGER BANK / 191 kW"]

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
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
