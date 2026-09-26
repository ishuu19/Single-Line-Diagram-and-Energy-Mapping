sld "GEN-0379 — RETAIL FACILITY / ELECTRICAL DISTRIBUTION"
# STORE SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-498", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
mcbA1 = breaker [label: "CB-342", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-717", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1019", rating: "kW / kWh"]
f1cb = breaker [label: "CB-371", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-784", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1029", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-372", rating: "MCCB / 25 A / 3P"]
f1l1m = motor [label: "MTR-1171", rating: "12 kW / EF"]
f2cb = breaker [label: "CB-314", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-787", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
f2pnl = hub [label: "FD-979", rating: "3P+N"]
f2l1cb = breaker [label: "CB-355", rating: "MCCB / 63 A / 3P"]
f2l1drv = vfd [label: "DRV-889", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1199", rating: "28 kW / AHU"]
f2l2ld = load [label: "PNL-1453", rating: "SALES FLOOR LIGHTING / 39 kW"]
f3cb = breaker [label: "CB-379", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-735", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1026", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-384", rating: "MCCB / 16 A / 3P"]
f3l1m = motor [label: "MTR-1160", rating: "5 kW / EF"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
