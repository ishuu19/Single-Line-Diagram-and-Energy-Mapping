sld "GEN-1292 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-478", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1613", rating: "830 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-372", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-723", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1013", rating: "kW / kWh"]
f1cb = breaker [label: "CB-382", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-782", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1053", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1487", rating: "CELLAR PANEL / 20 kW"]
f2cb = breaker [label: "CB-388", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-739", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1038", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-340", rating: "MCCB / 32 A / 3P"]
f2l1m = motor [label: "MTR-1162", rating: "18 kW / COMP"]
f3cb = breaker [label: "CB-315", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-719", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1032", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-366", rating: "MCCB / 50 A / 3P"]
f3l1m = motor [label: "MTR-1198", rating: "24 kW / COND"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
