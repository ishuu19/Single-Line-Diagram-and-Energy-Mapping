sld "GEN-1307 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-450", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1692", rating: "670 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-370", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-734", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
f1cb = breaker [label: "CB-300", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-704", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
f1pnl = hub [label: "FD-949", rating: "3P+N"]
f1l1ld = load [label: "PNL-1427", rating: "CANOPY AUXILIARIES / 23 kW"]
f1l2ld = load [label: "PNL-1441", rating: "FORECOURT LIGHTING / 15 kW"]
f2cb = breaker [label: "CB-302", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-749", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1030", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1432", rating: "FORECOURT LIGHTING / 12 kW"]
f3cb = breaker [label: "CB-367", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-717", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1094", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1435", rating: "DC FAST CHARGER BANK / 120 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
