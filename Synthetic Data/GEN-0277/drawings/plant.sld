sld "GEN-0277 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-469", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
mcbA1 = breaker [label: "CB-310", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-738", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1066", rating: "kW / kWh"]
srcA2 = utility [label: "12.47kV STANDBY", voltage: "12.47kV"]
txA2 = transformer_dy [label: "TX-1651", rating: "580 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA2 = breaker [label: "CB-380", rating: "ACB / 1600 A / 3P"]
mctA2 = ct [label: "TA-798", rating: "3 CTs / 1600/5 A"]
mpmA2 = watthour_meter [label: "PM-1004", rating: "kW / kWh"]
srcA3 = solar [label: "PV ARRAY 565 kW", voltage: "208Y/120V"]
mcbA3 = breaker [label: "CB-362", rating: "MCCB / 400 A / 3P"]
mctA3 = ct [label: "TA-759", rating: "3 CTs / 400/5 A"]
mpmA3 = watthour_meter [label: "PM-1090", rating: "kW / kWh"]
f1cb = breaker [label: "CB-390", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-774", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1030", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1447", rating: "AUXILIARY PANEL / 12 kW"]
f2cb = breaker [label: "CB-388", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-737", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1022", rating: "kW / kWh"]
f2pnl = hub [label: "FD-925", rating: "3P+N"]
f2l1ld = load [label: "PNL-1438", rating: "CONTROL PANEL / 21 kW"]
f2l2ld = load [label: "PNL-1470", rating: "GROW LIGHTING / 72 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
srcA3 -> mcbA3
mcbA3 -> mctA3
mctA3 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
mctA2 -> mpmA2
mctA3 -> mpmA3
f1ct -> f1pm
f2ct -> f2pm
