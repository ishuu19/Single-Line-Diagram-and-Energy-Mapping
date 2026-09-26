sld "GEN-1100 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-460", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1652", rating: "550 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-392", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-707", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1050", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 462 kW", voltage: "400Y/230V"]
mcbA2 = breaker [label: "CB-362", rating: "MCCB / 400 A / 3P"]
mctA2 = ct [label: "TA-749", rating: "3 CTs / 400/5 A"]
mpmA2 = watthour_meter [label: "PM-1004", rating: "kW / kWh"]
f1cb = breaker [label: "CB-344", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-772", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1419", rating: "AUXILIARY PANEL / 21 kW"]
f2cb = breaker [label: "CB-376", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-721", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1063", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1411", rating: "SITE LIGHTING / 22 kW"]
f3cb = breaker [label: "CB-340", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-744", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1057", rating: "kW / kWh"]
f3pnl = hub [label: "FD-932", rating: "3P+N"]
f3l1ld = load [label: "PNL-1470", rating: "ACADEMIC BLOCK PANEL / 78 kW"]
f3l2ld = load [label: "PNL-1429", rating: "SITE LIGHTING / 26 kW"]

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
f2ct -> f2l1ld
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
