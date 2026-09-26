sld "GEN-0937 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-412", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1660", rating: "230 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-324", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-745", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1047", rating: "kW / kWh"]
f1cb = breaker [label: "CB-367", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-731", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f1pnl = hub [label: "FD-988", rating: "3P+N"]
f1l1cb = breaker [label: "CB-397", rating: "MCCB / 32 A / 3P"]
f1l1m = motor [label: "MTR-1116", rating: "8 kW / EF"]
f1l2cb = breaker [label: "CB-316", rating: "MCCB / 40 A / 3P"]
f1l2m = motor [label: "MTR-1191", rating: "10 kW / EF"]
f2cb = breaker [label: "CB-321", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-732", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1088", rating: "kW / kWh"]
f2pnl = hub [label: "FD-950", rating: "3P+N"]
f2l1ld = load [label: "PNL-1491", rating: "CLASSROOM LIGHTING / 28 kW"]
f2l2ld = load [label: "PNL-1413", rating: "CLASSROOM LIGHTING / 52 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2m
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
