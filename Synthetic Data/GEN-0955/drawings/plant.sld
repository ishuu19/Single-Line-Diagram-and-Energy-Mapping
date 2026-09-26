sld "GEN-0955 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-497", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
mcbA1 = breaker [label: "CB-386", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-791", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1007", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 543 kW", voltage: "208Y/120V"]
mcbA2 = breaker [label: "CB-351", rating: "MCCB / 250 A / 3P"]
mctA2 = ct [label: "TA-736", rating: "3 CTs / 250/5 A"]
mpmA2 = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
f1cb = breaker [label: "CB-350", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-713", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1422", rating: "SITE LIGHTING / 24 kW"]
f2cb = breaker [label: "CB-381", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-731", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1024", rating: "kW / kWh"]
f2pnl = hub [label: "FD-919", rating: "3P+N"]
f2l1ld = load [label: "PNL-1443", rating: "ACADEMIC BLOCK PANEL / 65 kW"]
f2l2ld = load [label: "PNL-1426", rating: "SITE LIGHTING / 18 kW"]
f3cb = breaker [label: "CB-313", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-757", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1026", rating: "kW / kWh"]
f3pnl = hub [label: "FD-931", rating: "3P+N"]
f3l1ld = load [label: "PNL-1464", rating: "AUXILIARY PANEL / 25 kW"]
f3l2ld = load [label: "PNL-1406", rating: "ACADEMIC BLOCK PANEL / 73 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
