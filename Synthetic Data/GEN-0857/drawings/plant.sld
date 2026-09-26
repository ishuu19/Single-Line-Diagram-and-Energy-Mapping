sld "GEN-0857 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-495", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1648", rating: "1110 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-348", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-754", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1004", rating: "kW / kWh"]
f1cb = breaker [label: "CB-365", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-706", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1014", rating: "kW / kWh"]
f1pnl = hub [label: "FD-947", rating: "3P+N"]
f1l1ld = load [label: "PNL-1453", rating: "DC FAST CHARGER BANK / 149 kW"]
f1l2ld = load [label: "PNL-1491", rating: "CANOPY AUXILIARIES / 34 kW"]
f2cb = breaker [label: "CB-306", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-704", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1427", rating: "CANOPY AUXILIARIES / 25 kW"]
f3cb = breaker [label: "CB-303", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-729", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1099", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1406", rating: "CANOPY AUXILIARIES / 35 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
