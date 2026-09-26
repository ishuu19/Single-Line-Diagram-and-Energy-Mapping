sld "GEN-0722 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-441", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1657", rating: "330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-346", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-797", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
f1cb = breaker [label: "CB-392", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-790", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1087", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-380", rating: "MCCB / 32 A / 3P"]
f1l1drv = vfd [label: "DRV-888", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1131", rating: "16 kW / CRAC"]
f2cb = breaker [label: "CB-376", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-744", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1097", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1406", rating: "RECTIFIER PDU / 35 kW"]
f3cb = breaker [label: "CB-399", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-732", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1067", rating: "kW / kWh"]
f3pnl = hub [label: "FD-980", rating: "3P+N"]
f3l1ld = load [label: "PNL-1400", rating: "SHELTER LIGHTING / 10 kW"]
f3l2ld = load [label: "PNL-1416", rating: "RECTIFIER PDU / 20 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
