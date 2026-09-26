sld "GEN-1434 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-435", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1655", rating: "720 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-392", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-735", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1069", rating: "kW / kWh"]
srcA2 = utility [label: "12.47kV STANDBY", voltage: "12.47kV"]
txA2 = transformer_yd [label: "TX-1658", rating: "720 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA2 = breaker [label: "CB-305", rating: "ACB / 2000 A / 3P"]
mctA2 = ct [label: "TA-741", rating: "3 CTs / 2000/5 A"]
mpmA2 = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f1cb = breaker [label: "CB-350", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-760", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f1pnl = hub [label: "FD-945", rating: "3P+N"]
f1l1ld = load [label: "PNL-1459", rating: "DOCK LIGHTING / 13 kW"]
f1l2cb = breaker [label: "CB-316", rating: "MCCB / 40 A / 3P"]
f1l2m = motor [label: "MTR-1142", rating: "10 kW / EF"]
f2cb = breaker [label: "CB-387", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-711", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
f2pnl = hub [label: "FD-956", rating: "3P+N"]
f2l1ld = load [label: "PNL-1435", rating: "DOCK LIGHTING / 18 kW"]
f2l2ld = load [label: "PNL-1428", rating: "DOCK LIGHTING / 13 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
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
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
