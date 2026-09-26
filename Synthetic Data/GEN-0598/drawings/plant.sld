sld "GEN-0598 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-422", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
mcbA1 = breaker [label: "CB-362", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-773", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
srcA2 = utility [label: "13.8kV STANDBY", voltage: "13.8kV"]
txA2 = transformer_dy [label: "TX-1671", rating: "520 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA2 = breaker [label: "CB-386", rating: "ACB / 630 A / 3P"]
mctA2 = ct [label: "TA-794", rating: "3 CTs / 630/5 A"]
mpmA2 = watthour_meter [label: "PM-1031", rating: "kW / kWh"]
f1cb = breaker [label: "CB-360", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-740", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1081", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1446", rating: "AUXILIARY PANEL / 43 kW"]
f2cb = breaker [label: "CB-374", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-747", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1038", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1474", rating: "AUXILIARY PANEL / 26 kW"]
f3cb = breaker [label: "CB-315", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-739", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
f3pnl = hub [label: "FD-975", rating: "3P+N"]
f3l1ld = load [label: "PNL-1428", rating: "UTILITY PANEL / 28 kW"]
f3l2ld = load [label: "PNL-1444", rating: "AUXILIARY PANEL / 27 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
