sld "GEN-0749 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-405", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1678", rating: "830 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-381", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-759", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
f1cb = breaker [label: "CB-374", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-706", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1013", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1442", rating: "AUXILIARY PANEL / 69 kW"]
f2cb = breaker [label: "CB-366", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-732", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1029", rating: "kW / kWh"]
f2pnl = hub [label: "FD-993", rating: "3P+N"]
f2l1cb = breaker [label: "CB-346", rating: "MCCB / 50 A / 3P"]
f2l1m = motor [label: "MTR-1188", rating: "27 kW / COND"]
f2l2cb = breaker [label: "CB-344", rating: "MCCB / 125 A / 3P"]
f2l2drv = vfd [label: "DRV-843", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1154", rating: "66 kW / COMP"]
f3cb = breaker [label: "CB-365", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-776", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-334", rating: "MCCB / 125 A / 3P"]
f3l1drv = vfd [label: "DRV-862", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1184", rating: "62 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1m
f2pnl -> f2l2cb
f2l2cb -> f2l2drv
f2l2drv -> f2l2m
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
