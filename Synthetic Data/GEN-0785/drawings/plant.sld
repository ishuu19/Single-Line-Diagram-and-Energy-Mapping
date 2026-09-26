sld "GEN-0785 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-488", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1691", rating: "1110 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-365", rating: "MCCB / 1600 A / 3P"]
mctA1 = ct [label: "TA-765", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1000", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 415 kW", voltage: "400Y/230V"]
mcbA2 = breaker [label: "CB-313", rating: "MCCB / 630 A / 3P"]
mctA2 = ct [label: "TA-717", rating: "3 CTs / 630/5 A"]
mpmA2 = watthour_meter [label: "PM-1057", rating: "kW / kWh"]
f1cb = breaker [label: "CB-361", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-744", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f1pnl = hub [label: "FD-944", rating: "3P+N"]
f1l1ld = load [label: "PNL-1411", rating: "AUXILIARY PANEL / 27 kW"]
f1l2ld = load [label: "PNL-1480", rating: "AUXILIARY PANEL / 37 kW"]
f2cb = breaker [label: "CB-342", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-790", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1053", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1432", rating: "SITE LIGHTING / 22 kW"]
f3cb = breaker [label: "CB-341", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-782", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1486", rating: "ACADEMIC BLOCK PANEL / 89 kW"]

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
busA -> f2cb [cable: "3#4 AWG"]
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
