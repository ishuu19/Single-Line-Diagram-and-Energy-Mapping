sld "GEN-1415 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-494", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1627", rating: "670 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-353", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-794", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
busB = bus [label: "BUS-499", voltage: "480Y/277V"]
srcB1 = utility [label: "13.8kV SUPPLY B", voltage: "13.8kV"]
txB1 = transformer_yd [label: "TX-1612", rating: "1660 kVA", voltage: "13.8kV / 480Y/277V"]
mcbB1 = breaker [label: "CB-317", rating: "ACB / 2000 A / 3P"]
mctB1 = ct [label: "TA-763", rating: "3 CTs / 2000/5 A"]
mpmB1 = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
tie = bus_tie [label: "CB-334", rating: "630 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-372", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-790", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
f1pnl = hub [label: "FD-963", rating: "3P+N"]
f1l1ld = load [label: "PNL-1431", rating: "CLASSROOM LIGHTING / 40 kW"]
f1l2ld = load [label: "PNL-1411", rating: "AUXILIARY PANEL / 26 kW"]
f2cb = breaker [label: "CB-337", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-721", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-366", rating: "MCCB / 20 A / 3P"]
f2l1m = motor [label: "MTR-1104", rating: "11 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> txB1
txB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busB -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
