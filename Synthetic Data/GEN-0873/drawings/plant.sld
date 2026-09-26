sld "GEN-0873 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-472", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1678", rating: "830 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-318", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-736", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1096", rating: "kW / kWh"]
srcA2 = utility [label: "13.8kV STANDBY", voltage: "13.8kV"]
txA2 = transformer_yd [label: "TX-1623", rating: "330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA2 = breaker [label: "CB-373", rating: "MCCB / 400 A / 3P"]
mctA2 = ct [label: "TA-740", rating: "3 CTs / 400/5 A"]
mpmA2 = watthour_meter [label: "PM-1056", rating: "kW / kWh"]
f1cb = breaker [label: "CB-326", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-778", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
f1pnl = hub [label: "FD-977", rating: "3P+N"]
f1l1ld = load [label: "PNL-1462", rating: "DOSING PANEL / 35 kW"]
f1l2cb = breaker [label: "CB-307", rating: "MCCB / 100 A / 3P"]
f1l2drv = vfd [label: "DRV-826", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1169", rating: "50 kW / RWP"]

srcA1 -> txA1
txA1 -> mcbA1
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
