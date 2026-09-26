sld "GEN-0126 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-432", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1647", rating: "1330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-370", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-773", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1088", rating: "kW / kWh"]
f1cb = breaker [label: "CB-396", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-796", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1486", rating: "SHOP LIGHTING / 17 kW"]
f2cb = breaker [label: "CB-326", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-738", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1066", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1429", rating: "SHOP AUXILIARIES / 29 kW"]
f3cb = breaker [label: "CB-399", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-741", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1087", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-354", rating: "MCCB / 160 A / 3P"]
f3l1drv = vfd [label: "DRV-813", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1142", rating: "77 kW / PROC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
