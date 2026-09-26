sld "GEN-0180 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-408", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1637", rating: "440 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-348", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-745", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 436 kW", voltage: "400Y/230V"]
mcbA2 = breaker [label: "CB-321", rating: "MCCB / 400 A / 3P"]
mctA2 = ct [label: "TA-785", rating: "3 CTs / 400/5 A"]
mpmA2 = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
f1cb = breaker [label: "CB-304", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-777", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1038", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-350", rating: "MCCB / 63 A / 3P"]
f1l1m = motor [label: "MTR-1171", rating: "28 kW / RWP"]
f2cb = breaker [label: "CB-339", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-759", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
f2pnl = hub [label: "FD-982", rating: "3P+N"]
f2l1ld = load [label: "PNL-1405", rating: "GROW LIGHTING / 74 kW"]
f2l2ld = load [label: "PNL-1413", rating: "AUXILIARY PANEL / 10 kW"]
f3cb = breaker [label: "CB-372", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-768", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1007", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1465", rating: "AUXILIARY PANEL / 16 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
