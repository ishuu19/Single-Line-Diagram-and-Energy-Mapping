sld "GEN-1395 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-483", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
mcbA1 = breaker [label: "CB-353", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-719", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1038", rating: "kW / kWh"]
f1cb = breaker [label: "CB-388", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-751", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1097", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1471", rating: "ACADEMIC BLOCK PANEL / 54 kW"]
f2cb = breaker [label: "CB-334", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-720", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
f2pnl = hub [label: "FD-957", rating: "3P+N"]
f2l1ld = load [label: "PNL-1453", rating: "ACADEMIC BLOCK PANEL / 70 kW"]
f2l2ld = load [label: "PNL-1420", rating: "SITE LIGHTING / 34 kW"]
f3cb = breaker [label: "CB-390", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-744", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f3pnl = hub [label: "FD-953", rating: "3P+N"]
f3l1cb = breaker [label: "CB-362", rating: "MCCB / 50 A / 3P"]
f3l1drv = vfd [label: "DRV-864", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1155", rating: "24 kW / AHU"]
f3l2cb = breaker [label: "CB-308", rating: "MCCB / 40 A / 3P"]
f3l2drv = vfd [label: "DRV-822", rating: "VFD / OL"]
f3l2m = motor [label: "MTR-1156", rating: "18 kW / AHU"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
f3pnl -> f3l2cb
f3l2cb -> f3l2drv
f3l2drv -> f3l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
