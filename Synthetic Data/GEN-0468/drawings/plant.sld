sld "GEN-0468 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-479", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1635", rating: "170 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-324", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-761", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
f1cb = breaker [label: "CB-362", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-787", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
f1pnl = hub [label: "FD-953", rating: "3P+N"]
f1l1cb = breaker [label: "CB-395", rating: "MCCB / 50 A / 3P"]
f1l1drv = vfd [label: "DRV-896", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1124", rating: "21 kW / BLOW"]
f1l2ld = load [label: "PNL-1413", rating: "DOSING PANEL / 40 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
f1pnl -> f1l2ld
mctA1 -> mpmA1
f1ct -> f1pm
