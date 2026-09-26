sld "GEN-0139 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-428", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1642", rating: "170 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-305", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-782", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
f1cb = breaker [label: "CB-315", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-725", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1029", rating: "kW / kWh"]
f1pnl = hub [label: "FD-985", rating: "3P+N"]
f1l1ld = load [label: "PNL-1433", rating: "FORECOURT LIGHTING / 20 kW"]
f1l2ld = load [label: "PNL-1489", rating: "CANOPY AUXILIARIES / 23 kW"]
f2cb = breaker [label: "CB-327", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-744", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1452", rating: "FORECOURT LIGHTING / 21 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
