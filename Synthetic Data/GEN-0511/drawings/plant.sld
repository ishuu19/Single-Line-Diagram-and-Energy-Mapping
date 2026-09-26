sld "GEN-0511 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-499", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
mcbA1 = breaker [label: "CB-345", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-721", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1025", rating: "kW / kWh"]
srcA2 = utility [label: "12.47kV STANDBY", voltage: "12.47kV"]
txA2 = transformer_dy [label: "TX-1679", rating: "230 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA2 = breaker [label: "CB-371", rating: "ACB / 630 A / 3P"]
mctA2 = ct [label: "TA-703", rating: "3 CTs / 630/5 A"]
mpmA2 = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
f1cb = breaker [label: "CB-338", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-788", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1020", rating: "kW / kWh"]
f1pnl = hub [label: "FD-956", rating: "3P+N"]
f1l1ld = load [label: "PNL-1458", rating: "DOSING PANEL / 39 kW"]
f1l2cb = breaker [label: "CB-318", rating: "MCCB / 160 A / 3P"]
f1l2drv = vfd [label: "DRV-853", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1102", rating: "36 kW / BLOW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
