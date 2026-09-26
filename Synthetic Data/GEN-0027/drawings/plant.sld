sld "GEN-0027 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-494", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
mcbA1 = breaker [label: "CB-371", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-798", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1030", rating: "kW / kWh"]
f1cb = breaker [label: "CB-313", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-748", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-364", rating: "MCCB / 50 A / 3P"]
f1l1m = motor [label: "MTR-1158", rating: "21 kW / RWP"]
f2cb = breaker [label: "CB-391", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-737", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1000", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1480", rating: "GROW LIGHTING / 49 kW"]
f3cb = breaker [label: "CB-385", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-758", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1069", rating: "kW / kWh"]
f3pnl = hub [label: "FD-949", rating: "3P+N"]
f3l1ld = load [label: "PNL-1475", rating: "GROW LIGHTING / 59 kW"]
f3l2ld = load [label: "PNL-1484", rating: "CONTROL PANEL / 22 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
