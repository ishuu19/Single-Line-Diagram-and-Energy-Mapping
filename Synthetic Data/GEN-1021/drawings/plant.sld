sld "GEN-1021 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-474", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
mcbA1 = breaker [label: "CB-383", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-703", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
f1cb = breaker [label: "CB-382", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-775", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1485", rating: "FORECOURT LIGHTING / 24 kW"]
f2cb = breaker [label: "CB-385", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-753", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1003", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1420", rating: "CANOPY AUXILIARIES / 27 kW"]
f3cb = breaker [label: "CB-342", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-786", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1044", rating: "kW / kWh"]
f3pnl = hub [label: "FD-936", rating: "3P+N"]
f3l1ld = load [label: "PNL-1484", rating: "DC FAST CHARGER BANK / 129 kW"]
f3l2ld = load [label: "PNL-1402", rating: "CANOPY AUXILIARIES / 27 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
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
