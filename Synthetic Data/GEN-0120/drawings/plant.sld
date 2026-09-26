sld "GEN-0120 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-433", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1610", rating: "690 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-361", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-764", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
f1cb = breaker [label: "CB-354", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-701", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1000", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1412", rating: "DC FAST CHARGER BANK / 145 kW"]
f2cb = breaker [label: "CB-316", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-755", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1058", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1467", rating: "CANOPY AUXILIARIES / 22 kW"]
f3cb = breaker [label: "CB-329", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-727", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1014", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1453", rating: "CANOPY AUXILIARIES / 22 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
