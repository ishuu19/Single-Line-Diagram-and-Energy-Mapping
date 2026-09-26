sld "GEN-1079 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-421", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1676", rating: "210 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-310", rating: "MCCB / 250 A / 3P"]
mctA1 = ct [label: "TA-786", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1049", rating: "kW / kWh"]
srcA2 = utility [label: "13.8kV STANDBY", voltage: "13.8kV"]
txA2 = transformer_dy [label: "TX-1699", rating: "520 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA2 = breaker [label: "CB-331", rating: "ACB / 630 A / 3P"]
mctA2 = ct [label: "TA-727", rating: "3 CTs / 630/5 A"]
mpmA2 = watthour_meter [label: "PM-1042", rating: "kW / kWh"]
f1cb = breaker [label: "CB-329", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-701", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
f1pnl = hub [label: "FD-964", rating: "3P+N"]
f1l1ld = load [label: "PNL-1444", rating: "DC FAST CHARGER BANK / 166 kW"]
f1l2ld = load [label: "PNL-1464", rating: "FORECOURT LIGHTING / 25 kW"]
f2cb = breaker [label: "CB-355", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-744", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1011", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1400", rating: "DC FAST CHARGER BANK / 83 kW"]
f3cb = breaker [label: "CB-386", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-785", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1483", rating: "CANOPY AUXILIARIES / 33 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
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
f3ct -> f3l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
