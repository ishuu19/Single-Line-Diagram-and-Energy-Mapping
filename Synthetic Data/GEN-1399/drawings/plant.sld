sld "GEN-1399 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-480", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1638", rating: "2490 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-306", rating: "ACB / 3000 A / 3P"]
mctA1 = ct [label: "TA-780", rating: "3 CTs / 3000/5 A"]
mpmA1 = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
f1cb = breaker [label: "CB-323", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-755", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1079", rating: "kW / kWh"]
f1pnl = hub [label: "FD-949", rating: "3P+N"]
f1l1ld = load [label: "PNL-1471", rating: "AUXILIARY PANEL / 268 kW"]
f1l2ld = load [label: "PNL-1470", rating: "MCC AUXILIARY BOARD / 61 kW"]
f2cb = breaker [label: "CB-390", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-765", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1058", rating: "kW / kWh"]
f2pnl = hub [label: "FD-903", rating: "3P+N"]
f2l1cb = breaker [label: "CB-370", rating: "MCCB / 320 A / 3P"]
f2l1m = motor [label: "MTR-1126", rating: "191 kW / BLOW"]
f2l2ld = load [label: "PNL-1435", rating: "AUXILIARY PANEL / 587 kW"]
f3cb = breaker [label: "CB-304", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-745", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1011", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-328", rating: "MCCB / 800 A / 3P"]
f3l1drv = vfd [label: "DRV-876", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1184", rating: "401 kW / MILL"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1m
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
