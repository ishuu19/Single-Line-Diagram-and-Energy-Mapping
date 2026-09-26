sld "GEN-0111 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-459", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1612", rating: "280 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-342", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-733", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1099", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 265 kW", voltage: "400Y/230V"]
mcbA2 = breaker [label: "CB-378", rating: "MCCB / 800 A / 3P"]
mctA2 = ct [label: "TA-723", rating: "3 CTs / 800/5 A"]
mpmA2 = watthour_meter [label: "PM-1033", rating: "kW / kWh"]
f1cb = breaker [label: "CB-306", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-745", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1032", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1424", rating: "AUXILIARY PANEL / 37 kW"]
f2cb = breaker [label: "CB-328", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-748", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1088", rating: "kW / kWh"]
f2pnl = hub [label: "FD-949", rating: "3P+N"]
f2l1ld = load [label: "PNL-1451", rating: "ACADEMIC BLOCK PANEL / 72 kW"]
f2l2ld = load [label: "PNL-1403", rating: "SITE LIGHTING / 26 kW"]
f3cb = breaker [label: "CB-362", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-776", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1000", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1429", rating: "AUXILIARY PANEL / 16 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
