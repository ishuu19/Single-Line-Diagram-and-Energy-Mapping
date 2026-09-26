sld "GEN-1521 — RETAIL FACILITY / ELECTRICAL DISTRIBUTION"
# STORE SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-454", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
mcbA1 = breaker [label: "CB-371", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-708", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1053", rating: "kW / kWh"]
f1cb = breaker [label: "CB-341", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-775", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1051", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1495", rating: "HOUSE PANEL / 47 kW"]
f2cb = breaker [label: "CB-301", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-763", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f2pnl = hub [label: "FD-962", rating: "3P+N"]
f2l1ld = load [label: "PNL-1459", rating: "HOUSE PANEL / 52 kW"]
f2l2cb = breaker [label: "CB-360", rating: "MCCB / 32 A / 3P"]
f2l2drv = vfd [label: "DRV-815", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1134", rating: "13 kW / AHU"]
f3cb = breaker [label: "CB-343", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-740", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-396", rating: "MCCB / 50 A / 3P"]
f3l1drv = vfd [label: "DRV-898", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1144", rating: "23 kW / AHU"]

srcA1 -> mcbA1
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
f2l2cb -> f2l2drv
f2l2drv -> f2l2m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
