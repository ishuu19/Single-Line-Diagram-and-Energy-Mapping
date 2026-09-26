sld "GEN-1168 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-482", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1696", rating: "210 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-306", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-775", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1044", rating: "kW / kWh"]
srcA2 = utility [label: "13.8kV STANDBY", voltage: "13.8kV"]
txA2 = transformer_yd [label: "TX-1607", rating: "1660 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA2 = breaker [label: "CB-316", rating: "ACB / 2000 A / 3P"]
mctA2 = ct [label: "TA-716", rating: "3 CTs / 2000/5 A"]
mpmA2 = watthour_meter [label: "PM-1078", rating: "kW / kWh"]
f1cb = breaker [label: "CB-389", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-763", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1410", rating: "AUXILIARY PANEL / 33 kW"]
f2cb = breaker [label: "CB-314", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-764", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1077", rating: "kW / kWh"]
f2pnl = hub [label: "FD-906", rating: "3P+N"]
f2l1ld = load [label: "PNL-1429", rating: "UTILITY PANEL / 11 kW"]
f2l2ld = load [label: "PNL-1481", rating: "AUXILIARY PANEL / 15 kW"]
f3cb = breaker [label: "CB-376", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-772", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1015", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1492", rating: "AUXILIARY PANEL / 23 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
