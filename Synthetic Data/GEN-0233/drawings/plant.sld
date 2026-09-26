sld "GEN-0233 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-415", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1640", rating: "440 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-375", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-767", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1067", rating: "kW / kWh"]
f1cb = breaker [label: "CB-338", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-758", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1015", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1481", rating: "FORECOURT LIGHTING / 22 kW"]
f2cb = breaker [label: "CB-303", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-777", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1041", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1458", rating: "DC FAST CHARGER BANK / 210 kW"]
f3cb = breaker [label: "CB-365", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-764", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1099", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1485", rating: "CANOPY AUXILIARIES / 23 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
