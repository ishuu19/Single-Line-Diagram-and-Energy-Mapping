sld "GEN-1310 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-457", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1625", rating: "1390 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-322", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-759", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
f1cb = breaker [label: "CB-319", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-726", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1047", rating: "kW / kWh"]
f1pnl = hub [label: "FD-936", rating: "3P+N"]
f1l1cb = breaker [label: "CB-329", rating: "MCCB / 125 A / 3P"]
f1l1m = motor [label: "MTR-1129", rating: "54 kW / COMP"]
f1l2ld = load [label: "PNL-1488", rating: "SHOP AUXILIARIES / 42 kW"]
f2cb = breaker [label: "CB-369", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-761", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
f2pnl = hub [label: "FD-901", rating: "3P+N"]
f2l1ld = load [label: "PNL-1499", rating: "SHOP LIGHTING / 34 kW"]
f2l2ld = load [label: "PNL-1414", rating: "SHOP LIGHTING / 34 kW"]
f3cb = breaker [label: "CB-321", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-723", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1045", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1487", rating: "SHOP AUXILIARIES / 33 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
