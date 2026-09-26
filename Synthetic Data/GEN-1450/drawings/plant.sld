sld "GEN-1450 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-498", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1620", rating: "1390 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-307", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-723", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
f1cb = breaker [label: "CB-399", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-778", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1050", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-325", rating: "MCCB / 16 A / 3P"]
f1l1m = motor [label: "MTR-1156", rating: "7 kW / EF"]
f2cb = breaker [label: "CB-339", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-737", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1076", rating: "kW / kWh"]
f2pnl = hub [label: "FD-911", rating: "3P+N"]
f2l1cb = breaker [label: "CB-301", rating: "MCCB / 32 A / 3P"]
f2l1m = motor [label: "MTR-1110", rating: "15 kW / EF"]
f2l2cb = breaker [label: "CB-371", rating: "MCCB / 25 A / 3P"]
f2l2m = motor [label: "MTR-1171", rating: "11 kW / EF"]
f3cb = breaker [label: "CB-376", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-761", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1036", rating: "kW / kWh"]
f3pnl = hub [label: "FD-987", rating: "3P+N"]
f3l1ld = load [label: "PNL-1491", rating: "COMMON AREA LIGHTING / 21 kW"]
f3l2ld = load [label: "PNL-1424", rating: "AUXILIARY PANEL / 30 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1m
f2pnl -> f2l2cb
f2l2cb -> f2l2m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
