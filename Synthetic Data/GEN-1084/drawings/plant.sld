sld "GEN-1084 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-491", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1621", rating: "1330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-353", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-756", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
f1cb = breaker [label: "CB-331", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-728", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1442", rating: "CRITICAL BRANCH / 54 kW"]
f2cb = breaker [label: "CB-334", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-788", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
f2pnl = hub [label: "FD-984", rating: "3P+N"]
f2l1cb = breaker [label: "CB-376", rating: "MCCB / 32 A / 3P"]
f2l1drv = vfd [label: "DRV-846", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1197", rating: "18 kW / AHU"]
f2l2ld = load [label: "PNL-1410", rating: "WARD LIGHTING / 41 kW"]
f3cb = breaker [label: "CB-381", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-782", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1054", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1411", rating: "CRITICAL BRANCH / 40 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
