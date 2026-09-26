sld "GEN-0680 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-400", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1648", rating: "230 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-347", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-729", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1067", rating: "kW / kWh"]
f1cb = breaker [label: "CB-399", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-721", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1003", rating: "kW / kWh"]
f1pnl = hub [label: "FD-965", rating: "3P+N"]
f1l1ld = load [label: "PNL-1460", rating: "YARD LIGHTING / 33 kW"]
f1l2cb = breaker [label: "CB-369", rating: "MCCB / 32 A / 3P"]
f1l2m = motor [label: "MTR-1134", rating: "7 kW / EF"]
f2cb = breaker [label: "CB-395", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-730", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1066", rating: "kW / kWh"]
f2pnl = hub [label: "FD-907", rating: "3P+N"]
f2l1ld = load [label: "PNL-1493", rating: "YARD LIGHTING / 18 kW"]
f2l2ld = load [label: "PNL-1476", rating: "REEFER RACK PANEL / 99 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2m
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
