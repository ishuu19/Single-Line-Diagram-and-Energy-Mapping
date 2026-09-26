sld "GEN-0532 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-499", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1699", rating: "670 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-343", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-727", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1025", rating: "kW / kWh"]
f1cb = breaker [label: "CB-399", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-736", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1098", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1427", rating: "COMMON AREA LIGHTING / 33 kW"]
f2cb = breaker [label: "CB-319", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-761", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
f2pnl = hub [label: "FD-920", rating: "3P+N"]
f2l1cb = breaker [label: "CB-329", rating: "MCCB / 25 A / 3P"]
f2l1m = motor [label: "MTR-1195", rating: "12 kW / EF"]
f2l2ld = load [label: "PNL-1474", rating: "COMMON AREA LIGHTING / 46 kW"]
f3cb = breaker [label: "CB-311", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-718", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1038", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1479", rating: "RISER PANEL / 73 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1m
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
