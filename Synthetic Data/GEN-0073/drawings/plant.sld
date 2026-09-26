sld "GEN-0073 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-495", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1669", rating: "720 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-312", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-735", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1036", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 112 kW", voltage: "208Y/120V"]
mcbA2 = breaker [label: "CB-305", rating: "MCCB / 250 A / 3P"]
mctA2 = ct [label: "TA-770", rating: "3 CTs / 250/5 A"]
mpmA2 = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
f1cb = breaker [label: "CB-396", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-715", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1090", rating: "kW / kWh"]
f1pnl = hub [label: "FD-912", rating: "3P+N"]
f1l1cb = breaker [label: "CB-356", rating: "MCCB / 50 A / 3P"]
f1l1m = motor [label: "MTR-1105", rating: "12 kW / RWP"]
f1l2cb = breaker [label: "CB-366", rating: "MCCB / 63 A / 3P"]
f1l2m = motor [label: "MTR-1119", rating: "14 kW / RWP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
