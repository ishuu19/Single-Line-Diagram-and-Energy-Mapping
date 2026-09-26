sld "GEN-0025 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-440", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1689", rating: "290 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-399", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-776", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
f1cb = breaker [label: "CB-315", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-704", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1043", rating: "kW / kWh"]
f1pnl = hub [label: "FD-922", rating: "3P+N"]
f1l1ld = load [label: "PNL-1433", rating: "YARD LIGHTING / 33 kW"]
f1l2cb = breaker [label: "CB-373", rating: "MCCB / 32 A / 3P"]
f1l2m = motor [label: "MTR-1142", rating: "7 kW / EF"]
f2cb = breaker [label: "CB-396", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-754", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1054", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1403", rating: "YARD LIGHTING / 16 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2m
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
