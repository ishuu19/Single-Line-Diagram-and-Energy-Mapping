sld "GEN-1171 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-420", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1675", rating: "520 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-369", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-739", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1016", rating: "kW / kWh"]
f1cb = breaker [label: "CB-379", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-720", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1015", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-344", rating: "MCCB / 32 A / 3P"]
f1l1m = motor [label: "MTR-1171", rating: "15 kW / EF"]
f2cb = breaker [label: "CB-308", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-757", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1066", rating: "kW / kWh"]
f2pnl = hub [label: "FD-949", rating: "3P+N"]
f2l1ld = load [label: "PNL-1403", rating: "RISER PANEL / 72 kW"]
f2l2ld = load [label: "PNL-1483", rating: "COMMON AREA LIGHTING / 20 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
