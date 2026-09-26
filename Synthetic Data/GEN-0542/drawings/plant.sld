sld "GEN-0542 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-489", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
mcbA1 = breaker [label: "CB-347", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-706", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1073", rating: "kW / kWh"]
f1cb = breaker [label: "CB-315", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-788", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1476", rating: "FORECOURT LIGHTING / 25 kW"]
f2cb = breaker [label: "CB-399", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-797", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
f2pnl = hub [label: "FD-927", rating: "3P+N"]
f2l1ld = load [label: "PNL-1449", rating: "DC FAST CHARGER BANK / 99 kW"]
f2l2ld = load [label: "PNL-1444", rating: "FORECOURT LIGHTING / 20 kW"]
f3cb = breaker [label: "CB-324", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-790", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1056", rating: "kW / kWh"]
f3pnl = hub [label: "FD-910", rating: "3P+N"]
f3l1ld = load [label: "PNL-1432", rating: "CANOPY AUXILIARIES / 35 kW"]
f3l2ld = load [label: "PNL-1411", rating: "DC FAST CHARGER BANK / 136 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
