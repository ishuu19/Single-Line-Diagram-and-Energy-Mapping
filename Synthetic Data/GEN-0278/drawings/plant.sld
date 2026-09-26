sld "GEN-0278 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-403", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1695", rating: "1110 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-366", rating: "MCCB / 1600 A / 3P"]
mctA1 = ct [label: "TA-763", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1036", rating: "kW / kWh"]
f1cb = breaker [label: "CB-379", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-733", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1003", rating: "kW / kWh"]
f1pnl = hub [label: "FD-998", rating: "3P+N"]
f1l1cb = breaker [label: "CB-323", rating: "MCCB / 25 A / 3P"]
f1l1m = motor [label: "MTR-1152", rating: "11 kW / EF"]
f1l2ld = load [label: "PNL-1462", rating: "CLASSROOM LIGHTING / 38 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2ld
mctA1 -> mpmA1
f1ct -> f1pm
