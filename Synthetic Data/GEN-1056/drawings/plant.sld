sld "GEN-1056 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-439", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1624", rating: "720 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-329", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-708", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1018", rating: "kW / kWh"]
f1cb = breaker [label: "CB-398", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-787", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1043", rating: "kW / kWh"]
f1pnl = hub [label: "FD-943", rating: "3P+N"]
f1l1ld = load [label: "PNL-1402", rating: "PRESS FLOOR PANEL / 37 kW"]
f1l2ld = load [label: "PNL-1457", rating: "SHOP LIGHTING / 17 kW"]
f2cb = breaker [label: "CB-393", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-754", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1453", rating: "SHOP LIGHTING / 11 kW"]
f3cb = breaker [label: "CB-300", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-764", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1076", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1498", rating: "PRESS FLOOR PANEL / 37 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
