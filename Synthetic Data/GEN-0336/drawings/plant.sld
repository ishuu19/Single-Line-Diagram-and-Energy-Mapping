sld "GEN-0336 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-484", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1661", rating: "1390 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-342", rating: "MCCB / 2000 A / 3P"]
mctA1 = ct [label: "TA-722", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1060", rating: "kW / kWh"]
f1cb = breaker [label: "CB-332", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-742", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1018", rating: "kW / kWh"]
f1pnl = hub [label: "FD-940", rating: "3P+N"]
f1l1cb = breaker [label: "CB-365", rating: "MCCB / 20 A / 3P"]
f1l1m = motor [label: "MTR-1179", rating: "9 kW / EF"]
f1l2cb = breaker [label: "CB-345", rating: "MCCB / 25 A / 3P"]
f1l2m = motor [label: "MTR-1108", rating: "10 kW / EF"]
f2cb = breaker [label: "CB-331", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-723", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f2pnl = hub [label: "FD-986", rating: "3P+N"]
f2l1cb = breaker [label: "CB-322", rating: "MCCB / 16 A / 3P"]
f2l1m = motor [label: "MTR-1182", rating: "7 kW / EF"]
f2l2ld = load [label: "PNL-1495", rating: "DOCK LIGHTING / 12 kW"]

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
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1m
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
