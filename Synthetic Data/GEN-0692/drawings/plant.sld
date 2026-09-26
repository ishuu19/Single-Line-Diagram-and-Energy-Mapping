sld "GEN-0692 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-486", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
mcbA1 = breaker [label: "CB-348", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-790", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1007", rating: "kW / kWh"]
f1cb = breaker [label: "CB-326", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-781", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1058", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1447", rating: "FORECOURT LIGHTING / 10 kW"]
f2cb = breaker [label: "CB-306", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-755", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1049", rating: "kW / kWh"]
f2pnl = hub [label: "FD-925", rating: "3P+N"]
f2l1ld = load [label: "PNL-1460", rating: "FORECOURT LIGHTING / 16 kW"]
f2l2ld = load [label: "PNL-1434", rating: "DC FAST CHARGER BANK / 195 kW"]
f3cb = breaker [label: "CB-308", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-744", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1403", rating: "FORECOURT LIGHTING / 25 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
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
