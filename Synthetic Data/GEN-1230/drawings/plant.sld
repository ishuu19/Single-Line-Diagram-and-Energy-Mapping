sld "GEN-1230 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-490", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1600", rating: "170 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-373", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-726", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1004", rating: "kW / kWh"]
f1cb = breaker [label: "CB-396", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-705", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1040", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1475", rating: "CANOPY AUXILIARIES / 25 kW"]
f2cb = breaker [label: "CB-326", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-775", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
f2pnl = hub [label: "FD-929", rating: "3P+N"]
f2l1ld = load [label: "PNL-1422", rating: "CANOPY AUXILIARIES / 21 kW"]
f2l2ld = load [label: "PNL-1451", rating: "DC FAST CHARGER BANK / 202 kW"]
f3cb = breaker [label: "CB-341", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-764", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1078", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1424", rating: "CANOPY AUXILIARIES / 26 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
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
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
