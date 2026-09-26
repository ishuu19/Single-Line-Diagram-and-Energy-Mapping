sld "GEN-1070 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-455", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1672", rating: "140 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-379", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-773", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
busB = bus [label: "BUS-494", voltage: "208Y/120V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "208Y/120V", rating: "80 kW"]
mcbB1 = breaker [label: "CB-301", rating: "ACB / 250 A / 3P"]
mctB1 = ct [label: "TA-757", rating: "3 CTs / 250/5 A"]
mpmB1 = watthour_meter [label: "PM-1043", rating: "kW / kWh"]
tie = ats [label: "CB-323", rating: "1000 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-366", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-789", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1038", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1442", rating: "CRITICAL BRANCH / 38 kW"]
f2cb = breaker [label: "CB-360", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-774", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
f2pnl = hub [label: "FD-926", rating: "3P+N"]
f2l1ld = load [label: "PNL-1498", rating: "CRITICAL BRANCH / 47 kW"]
f2l2ld = load [label: "PNL-1470", rating: "LIFE SAFETY BRANCH / 52 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
