sld "GEN-0183 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-411", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1625", rating: "830 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-334", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-799", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
srcA2 = utility [label: "13.8kV STANDBY", voltage: "13.8kV"]
txA2 = transformer_dy [label: "TX-1610", rating: "670 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA2 = breaker [label: "CB-339", rating: "ACB / 800 A / 3P"]
mctA2 = ct [label: "TA-735", rating: "3 CTs / 800/5 A"]
mpmA2 = watthour_meter [label: "PM-1098", rating: "kW / kWh"]
f1cb = breaker [label: "CB-384", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-761", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f1pnl = hub [label: "FD-987", rating: "3P+N"]
f1l1cb = breaker [label: "CB-305", rating: "MCCB / 50 A / 3P"]
f1l1drv = vfd [label: "DRV-857", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1110", rating: "26 kW / BLOW"]
f1l2ld = load [label: "PNL-1494", rating: "DOSING PANEL / 33 kW"]
f2cb = breaker [label: "CB-354", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-728", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-362", rating: "MCCB / 40 A / 3P"]
f2l1drv = vfd [label: "DRV-805", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1172", rating: "23 kW / BLOW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
