sld "GEN-0667 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-485", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1657", rating: "440 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-388", rating: "MCCB / 630 A / 3P"]
mctA1 = ct [label: "TA-770", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 197 kW", voltage: "400Y/230V"]
mcbA2 = breaker [label: "CB-318", rating: "MCCB / 160 A / 3P"]
mctA2 = ct [label: "TA-728", rating: "3 CTs / 160/5 A"]
mpmA2 = watthour_meter [label: "PM-1034", rating: "kW / kWh"]
f1cb = breaker [label: "CB-301", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-791", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
f1pnl = hub [label: "FD-983", rating: "3P+N"]
f1l1cb = breaker [label: "CB-328", rating: "MCCB / 63 A / 3P"]
f1l1m = motor [label: "MTR-1136", rating: "26 kW / RWP"]
f1l2ld = load [label: "PNL-1400", rating: "CONTROL PANEL / 24 kW"]

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
f1pnl -> f1l2ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
