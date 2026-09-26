sld "GEN-1146 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-424", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1617", rating: "520 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-314", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-799", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1003", rating: "kW / kWh"]
f1cb = breaker [label: "CB-366", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-780", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1462", rating: "DOCK LIGHTING / 15 kW"]
f2cb = breaker [label: "CB-374", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-749", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1007", rating: "kW / kWh"]
f2pnl = hub [label: "FD-914", rating: "3P+N"]
f2l1cb = breaker [label: "CB-325", rating: "MCCB / 16 A / 3P"]
f2l1m = motor [label: "MTR-1191", rating: "9 kW / EF"]
f2l2ld = load [label: "PNL-1417", rating: "SHORE POWER PANEL / 45 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1m
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
