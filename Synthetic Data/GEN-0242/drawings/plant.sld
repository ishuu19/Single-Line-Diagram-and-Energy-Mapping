sld "GEN-0242 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-408", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1628", rating: "670 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-322", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-733", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
f1cb = breaker [label: "CB-389", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-779", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1079", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1492", rating: "DC FAST CHARGER BANK / 232 kW"]
f2cb = breaker [label: "CB-343", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-725", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1097", rating: "kW / kWh"]
f2pnl = hub [label: "FD-987", rating: "3P+N"]
f2l1ld = load [label: "PNL-1402", rating: "DC FAST CHARGER BANK / 195 kW"]
f2l2ld = load [label: "PNL-1455", rating: "DC FAST CHARGER BANK / 145 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
