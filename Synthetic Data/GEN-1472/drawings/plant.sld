sld "GEN-1472 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-404", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1614", rating: "280 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-315", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-785", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 306 kW", voltage: "400Y/230V"]
mcbA2 = breaker [label: "CB-371", rating: "MCCB / 630 A / 3P"]
mctA2 = ct [label: "TA-706", rating: "3 CTs / 630/5 A"]
mpmA2 = watthour_meter [label: "PM-1042", rating: "kW / kWh"]
f1cb = breaker [label: "CB-377", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-745", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1076", rating: "kW / kWh"]
f1pnl = hub [label: "FD-912", rating: "3P+N"]
f1l1ld = load [label: "PNL-1436", rating: "DC FAST CHARGER BANK / 228 kW"]
f1l2ld = load [label: "PNL-1419", rating: "FORECOURT LIGHTING / 12 kW"]
f2cb = breaker [label: "CB-355", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-719", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1033", rating: "kW / kWh"]
f2pnl = hub [label: "FD-920", rating: "3P+N"]
f2l1ld = load [label: "PNL-1413", rating: "FORECOURT LIGHTING / 11 kW"]
f2l2ld = load [label: "PNL-1428", rating: "FORECOURT LIGHTING / 24 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
