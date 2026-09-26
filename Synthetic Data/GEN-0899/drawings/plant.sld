sld "GEN-0899 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-433", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
mcbA1 = breaker [label: "CB-333", rating: "MCCB / 160 A / 3P"]
mctA1 = ct [label: "TA-786", rating: "3 CTs / 160/5 A"]
mpmA1 = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
f1cb = breaker [label: "CB-339", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-769", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
f1pnl = hub [label: "FD-942", rating: "3P+N"]
f1l1ld = load [label: "PNL-1445", rating: "RECTIFIER PDU / 34 kW"]
f1l2ld = load [label: "PNL-1416", rating: "RECTIFIER PDU / 46 kW"]
f2cb = breaker [label: "CB-327", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-798", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1088", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1429", rating: "RECTIFIER PDU / 52 kW"]
f3cb = breaker [label: "CB-306", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-771", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1014", rating: "kW / kWh"]
f3pnl = hub [label: "FD-903", rating: "3P+N"]
f3l1ld = load [label: "PNL-1470", rating: "RECTIFIER PDU / 48 kW"]
f3l2ld = load [label: "PNL-1495", rating: "SHELTER LIGHTING / 11 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
