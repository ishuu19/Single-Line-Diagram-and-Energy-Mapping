sld "GEN-0545 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-485", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1620", rating: "230 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-311", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-791", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 596 kW", voltage: "208Y/120V"]
mcbA2 = breaker [label: "CB-360", rating: "MCCB / 630 A / 3P"]
mctA2 = ct [label: "TA-721", rating: "3 CTs / 630/5 A"]
mpmA2 = watthour_meter [label: "PM-1098", rating: "kW / kWh"]
f1cb = breaker [label: "CB-329", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-778", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1481", rating: "CONTROL PANEL / 17 kW"]
f2cb = breaker [label: "CB-331", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-703", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1458", rating: "AUXILIARY PANEL / 16 kW"]
f3cb = breaker [label: "CB-302", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-729", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1021", rating: "kW / kWh"]
f3pnl = hub [label: "FD-943", rating: "3P+N"]
f3l1ld = load [label: "PNL-1442", rating: "AUXILIARY PANEL / 9 kW"]
f3l2ld = load [label: "PNL-1460", rating: "AUXILIARY PANEL / 21 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
