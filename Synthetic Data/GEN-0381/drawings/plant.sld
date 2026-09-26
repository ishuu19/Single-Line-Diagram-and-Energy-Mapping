sld "GEN-0381 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-442", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1659", rating: "720 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-316", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-787", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1007", rating: "kW / kWh"]
f1cb = breaker [label: "CB-387", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-759", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1021", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1446", rating: "RISER PANEL / 99 kW"]
f2cb = breaker [label: "CB-364", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-710", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1044", rating: "kW / kWh"]
f2pnl = hub [label: "FD-905", rating: "3P+N"]
f2l1ld = load [label: "PNL-1426", rating: "COMMON AREA LIGHTING / 45 kW"]
f2l2cb = breaker [label: "CB-350", rating: "MCCB / 50 A / 3P"]
f2l2m = motor [label: "MTR-1187", rating: "11 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2cb
f2l2cb -> f2l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
