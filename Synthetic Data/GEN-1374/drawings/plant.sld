sld "GEN-1374 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-497", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1666", rating: "330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-325", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-749", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1098", rating: "kW / kWh"]
f1cb = breaker [label: "CB-378", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-715", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1048", rating: "kW / kWh"]
f1pnl = hub [label: "FD-935", rating: "3P+N"]
f1l1ld = load [label: "PNL-1460", rating: "FLOOR LIGHTING / 61 kW"]
f1l2ld = load [label: "PNL-1491", rating: "FLOOR LIGHTING / 72 kW"]
f2cb = breaker [label: "CB-326", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-791", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-309", rating: "MCCB / 32 A / 3P"]
f2l1m = motor [label: "MTR-1199", rating: "19 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
