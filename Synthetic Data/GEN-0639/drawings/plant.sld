sld "GEN-0639 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-462", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1634", rating: "280 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-351", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-750", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1036", rating: "kW / kWh"]
f1cb = breaker [label: "CB-311", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-718", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
f1pnl = hub [label: "FD-936", rating: "3P+N"]
f1l1ld = load [label: "PNL-1434", rating: "CANOPY AUXILIARIES / 35 kW"]
f1l2ld = load [label: "PNL-1453", rating: "FORECOURT LIGHTING / 11 kW"]
f2cb = breaker [label: "CB-398", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-727", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1068", rating: "kW / kWh"]
f2pnl = hub [label: "FD-969", rating: "3P+N"]
f2l1ld = load [label: "PNL-1442", rating: "CANOPY AUXILIARIES / 29 kW"]
f2l2ld = load [label: "PNL-1450", rating: "DC FAST CHARGER BANK / 230 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
