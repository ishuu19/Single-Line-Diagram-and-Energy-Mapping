sld "GEN-0125 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-435", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1656", rating: "210 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-353", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-704", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
f1cb = breaker [label: "CB-380", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-727", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
f1pnl = hub [label: "FD-957", rating: "3P+N"]
f1l1ld = load [label: "PNL-1484", rating: "TENANT PANEL / 67 kW"]
f1l2cb = breaker [label: "CB-354", rating: "MCCB / 16 A / 3P"]
f1l2m = motor [label: "MTR-1127", rating: "9 kW / EF"]
f2cb = breaker [label: "CB-348", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-772", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1043", rating: "kW / kWh"]
f2pnl = hub [label: "FD-909", rating: "3P+N"]
f2l1ld = load [label: "PNL-1449", rating: "FLOOR LIGHTING / 58 kW"]
f2l2ld = load [label: "PNL-1447", rating: "TENANT PANEL / 52 kW"]

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
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
