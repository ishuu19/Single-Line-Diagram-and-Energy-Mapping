sld "GEN-1059 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-421", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1644", rating: "580 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-301", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-705", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1007", rating: "kW / kWh"]
f1cb = breaker [label: "CB-354", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-779", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1020", rating: "kW / kWh"]
f1pnl = hub [label: "FD-905", rating: "3P+N"]
f1l1ld = load [label: "PNL-1400", rating: "DOCK LIGHTING / 25 kW"]
f1l2cb = breaker [label: "CB-379", rating: "MCCB / 20 A / 3P"]
f1l2m = motor [label: "MTR-1131", rating: "5 kW / EF"]
f2cb = breaker [label: "CB-316", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-701", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1077", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1471", rating: "DOCK LIGHTING / 22 kW"]

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
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
