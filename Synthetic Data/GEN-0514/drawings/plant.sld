sld "GEN-0514 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-476", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1600", rating: "670 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-382", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-799", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
f1cb = breaker [label: "CB-313", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-721", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-321", rating: "MCCB / 50 A / 3P"]
f1l1m = motor [label: "MTR-1111", rating: "27 kW / COND"]
f2cb = breaker [label: "CB-390", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-768", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1066", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1474", rating: "CELLAR PANEL / 19 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
