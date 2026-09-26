sld "GEN-1380 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-409", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
mcbA1 = breaker [label: "CB-317", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-769", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1007", rating: "kW / kWh"]
f1cb = breaker [label: "CB-318", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-709", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1029", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1486", rating: "CANOPY AUXILIARIES / 28 kW"]
f2cb = breaker [label: "CB-356", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-763", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1478", rating: "DC FAST CHARGER BANK / 170 kW"]
f3cb = breaker [label: "CB-309", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-735", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1089", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1418", rating: "DC FAST CHARGER BANK / 136 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
