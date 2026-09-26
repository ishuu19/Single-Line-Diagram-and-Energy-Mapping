sld "GEN-0865 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-404", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1632", rating: "330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-321", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-797", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1041", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 427 kW", voltage: "480Y/277V"]
mcbA2 = breaker [label: "CB-349", rating: "MCCB / 160 A / 3P"]
mctA2 = ct [label: "TA-777", rating: "3 CTs / 160/5 A"]
mpmA2 = watthour_meter [label: "PM-1000", rating: "kW / kWh"]
f1cb = breaker [label: "CB-317", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-701", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
f1pnl = hub [label: "FD-953", rating: "3P+N"]
f1l1ld = load [label: "PNL-1431", rating: "ACADEMIC BLOCK PANEL / 52 kW"]
f1l2ld = load [label: "PNL-1469", rating: "SITE LIGHTING / 30 kW"]
f2cb = breaker [label: "CB-358", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-746", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1020", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1429", rating: "AUXILIARY PANEL / 24 kW"]
f3cb = breaker [label: "CB-338", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-710", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1057", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1459", rating: "ACADEMIC BLOCK PANEL / 52 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
