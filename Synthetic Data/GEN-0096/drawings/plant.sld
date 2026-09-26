sld "GEN-0096 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-411", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1625", rating: "520 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-347", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-734", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1017", rating: "kW / kWh"]
f1cb = breaker [label: "CB-394", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-779", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1057", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1446", rating: "CONTROL PANEL / 12 kW"]
f2cb = breaker [label: "CB-327", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-781", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
f2pnl = hub [label: "FD-977", rating: "3P+N"]
f2l1cb = breaker [label: "CB-388", rating: "MCCB / 32 A / 3P"]
f2l1drv = vfd [label: "DRV-820", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1162", rating: "17 kW / EF"]
f2l2cb = breaker [label: "CB-321", rating: "MCCB / 50 A / 3P"]
f2l2m = motor [label: "MTR-1109", rating: "27 kW / RWP"]
f3cb = breaker [label: "CB-359", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-756", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-351", rating: "MCCB / 25 A / 3P"]
f3l1m = motor [label: "MTR-1165", rating: "13 kW / RWP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
f2pnl -> f2l2cb
f2l2cb -> f2l2m
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
