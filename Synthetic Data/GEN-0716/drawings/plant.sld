sld "GEN-0716 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-409", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1640", rating: "1330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-323", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-724", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 405 kW", voltage: "480Y/277V"]
mcbA2 = breaker [label: "CB-326", rating: "MCCB / 630 A / 3P"]
mctA2 = ct [label: "TA-743", rating: "3 CTs / 630/5 A"]
mpmA2 = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
f1cb = breaker [label: "CB-337", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-715", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1013", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1476", rating: "SITE LIGHTING / 34 kW"]
f2cb = breaker [label: "CB-352", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-747", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1034", rating: "kW / kWh"]
f2pnl = hub [label: "FD-997", rating: "3P+N"]
f2l1ld = load [label: "PNL-1497", rating: "ACADEMIC BLOCK PANEL / 82 kW"]
f2l2ld = load [label: "PNL-1470", rating: "SITE LIGHTING / 16 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
