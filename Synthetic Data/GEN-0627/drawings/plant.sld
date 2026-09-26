sld "GEN-0627 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-485", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1689", rating: "830 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-337", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-753", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1098", rating: "kW / kWh"]
srcA2 = generator [label: "STANDBY GENERATOR", voltage: "480Y/277V", rating: "300 kW"]
mcbA2 = breaker [label: "CB-344", rating: "ACB / 400 A / 3P"]
mctA2 = ct [label: "TA-797", rating: "3 CTs / 400/5 A"]
mpmA2 = watthour_meter [label: "PM-1056", rating: "kW / kWh"]
f1cb = breaker [label: "CB-353", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-760", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1077", rating: "kW / kWh"]
f1pnl = hub [label: "FD-985", rating: "3P+N"]
f1l1ld = load [label: "PNL-1437", rating: "AUXILIARY PANEL / 28 kW"]
f1l2cb = breaker [label: "CB-391", rating: "MCCB / 25 A / 3P"]
f1l2m = motor [label: "MTR-1132", rating: "14 kW / EF"]
f2cb = breaker [label: "CB-385", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-739", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1409", rating: "RISER PANEL / 49 kW"]
f3cb = breaker [label: "CB-352", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-713", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1413", rating: "RISER PANEL / 86 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2m
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
