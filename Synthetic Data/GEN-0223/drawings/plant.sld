sld "GEN-0223 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-407", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1631", rating: "1110 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-318", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-761", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
f1cb = breaker [label: "CB-376", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-779", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1452", rating: "DC FAST CHARGER BANK / 146 kW"]
f2cb = breaker [label: "CB-324", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-751", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1017", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1445", rating: "DC FAST CHARGER BANK / 125 kW"]
f3cb = breaker [label: "CB-383", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-796", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1404", rating: "CANOPY AUXILIARIES / 18 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
