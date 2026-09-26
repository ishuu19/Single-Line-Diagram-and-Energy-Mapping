sld "GEN-0604 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-492", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1660", rating: "440 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-320", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-710", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1095", rating: "kW / kWh"]
busB = bus [label: "BUS-415", voltage: "400Y/230V"]
srcB1 = utility [label: "6.6kV SUPPLY B", voltage: "6.6kV"]
mcbB1 = breaker [label: "CB-300", rating: "ACB / 630 A / 3P"]
mctB1 = ct [label: "TA-784", rating: "3 CTs / 630/5 A"]
mpmB1 = watthour_meter [label: "PM-1017", rating: "kW / kWh"]
tie = bus_tie [label: "CB-311", rating: "2000 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-360", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-726", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1019", rating: "kW / kWh"]
f1pnl = hub [label: "FD-916", rating: "3P+N"]
f1l1ld = load [label: "PNL-1431", rating: "AUXILIARY PANEL / 23 kW"]
f1l2ld = load [label: "PNL-1445", rating: "LIFE SAFETY BRANCH / 28 kW"]
f2cb = breaker [label: "CB-318", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-763", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1016", rating: "kW / kWh"]
f2pnl = hub [label: "FD-997", rating: "3P+N"]
f2l1ld = load [label: "PNL-1493", rating: "CRITICAL BRANCH / 41 kW"]
f2l2ld = load [label: "PNL-1425", rating: "WARD LIGHTING / 34 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busB -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
