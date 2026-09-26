sld "GEN-1527 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-457", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
mcbA1 = breaker [label: "CB-333", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-790", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1040", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 241 kW", voltage: "400Y/230V"]
mcbA2 = breaker [label: "CB-305", rating: "MCCB / 800 A / 3P"]
mctA2 = ct [label: "TA-736", rating: "3 CTs / 800/5 A"]
mpmA2 = watthour_meter [label: "PM-1020", rating: "kW / kWh"]
f1cb = breaker [label: "CB-344", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-788", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1042", rating: "kW / kWh"]
f1pnl = hub [label: "FD-935", rating: "3P+N"]
f1l1ld = load [label: "PNL-1460", rating: "SITE LIGHTING / 26 kW"]
f1l2cb = breaker [label: "CB-308", rating: "MCCB / 80 A / 3P"]
f1l2drv = vfd [label: "DRV-845", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1180", rating: "37 kW / AHU"]
f2cb = breaker [label: "CB-360", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-720", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1003", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1463", rating: "SITE LIGHTING / 19 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
