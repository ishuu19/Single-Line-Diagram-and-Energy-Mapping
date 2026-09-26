sld "GEN-1320 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-420", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1610", rating: "1390 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-305", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-745", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f1cb = breaker [label: "CB-399", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-791", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1087", rating: "kW / kWh"]
f1pnl = hub [label: "FD-985", rating: "3P+N"]
f1l1ld = load [label: "PNL-1474", rating: "CONTROL PANEL / 12 kW"]
f1l2cb = breaker [label: "CB-308", rating: "MCCB / 25 A / 3P"]
f1l2m = motor [label: "MTR-1184", rating: "11 kW / RWP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2m
mctA1 -> mpmA1
f1ct -> f1pm
