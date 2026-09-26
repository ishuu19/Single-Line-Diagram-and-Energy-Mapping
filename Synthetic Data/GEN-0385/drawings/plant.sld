sld "GEN-0385 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-417", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1604", rating: "1390 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-381", rating: "MCCB / 2000 A / 3P"]
mctA1 = ct [label: "TA-707", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
f1cb = breaker [label: "CB-380", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-778", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-344", rating: "MCCB / 40 A / 3P"]
f1l1drv = vfd [label: "DRV-839", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1119", rating: "18 kW / CRAC"]
f2cb = breaker [label: "CB-315", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-709", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1451", rating: "RISER PANEL / 73 kW"]
f3cb = breaker [label: "CB-300", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-704", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1087", rating: "kW / kWh"]
f3pnl = hub [label: "FD-994", rating: "3P+N"]
f3l1cb = breaker [label: "CB-394", rating: "MCCB / 20 A / 3P"]
f3l1m = motor [label: "MTR-1102", rating: "8 kW / EF"]
f3l2ld = load [label: "PNL-1454", rating: "COMMON AREA LIGHTING / 43 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1cb
f3l1cb -> f3l1m
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
