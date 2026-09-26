sld "GEN-0088 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-496", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
mcbA1 = breaker [label: "CB-339", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-757", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1058", rating: "kW / kWh"]
f1cb = breaker [label: "CB-334", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-792", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
f1pnl = hub [label: "FD-979", rating: "3P+N"]
f1l1ld = load [label: "PNL-1423", rating: "DOSING PANEL / 23 kW"]
f1l2cb = breaker [label: "CB-331", rating: "MCCB / 63 A / 3P"]
f1l2drv = vfd [label: "DRV-857", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1136", rating: "29 kW / BLOW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
mctA1 -> mpmA1
f1ct -> f1pm
