sld "GEN-0549 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-466", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1617", rating: "670 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-399", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-789", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1096", rating: "kW / kWh"]
f1cb = breaker [label: "CB-369", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-745", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1033", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-392", rating: "MCCB / 32 A / 3P"]
f1l1drv = vfd [label: "DRV-810", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1197", rating: "19 kW / BLOW"]
f2cb = breaker [label: "CB-398", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-792", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1032", rating: "kW / kWh"]
f2pnl = hub [label: "FD-940", rating: "3P+N"]
f2l1cb = breaker [label: "CB-357", rating: "MCCB / 125 A / 3P"]
f2l1drv = vfd [label: "DRV-896", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1193", rating: "63 kW / RWP"]
f2l2cb = breaker [label: "CB-378", rating: "MCCB / 100 A / 3P"]
f2l2drv = vfd [label: "DRV-850", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1127", rating: "55 kW / RWP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
f2pnl -> f2l2cb
f2l2cb -> f2l2drv
f2l2drv -> f2l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
