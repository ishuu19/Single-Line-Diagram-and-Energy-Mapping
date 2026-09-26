sld "GEN-1365 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-443", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1679", rating: "1390 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-366", rating: "MCCB / 2000 A / 3P"]
mctA1 = ct [label: "TA-704", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
f1cb = breaker [label: "CB-394", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-766", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1038", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1445", rating: "FLOOR LIGHTING / 81 kW"]
f2cb = breaker [label: "CB-304", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-765", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1032", rating: "kW / kWh"]
f2pnl = hub [label: "FD-933", rating: "3P+N"]
f2l1cb = breaker [label: "CB-364", rating: "MCCB / 50 A / 3P"]
f2l1m = motor [label: "MTR-1103", rating: "20 kW / EF"]
f2l2ld = load [label: "PNL-1481", rating: "FLOOR LIGHTING / 65 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1m
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
