sld "GEN-0169 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-482", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1674", rating: "170 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-324", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-763", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1030", rating: "kW / kWh"]
f1cb = breaker [label: "CB-385", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-746", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
f1pnl = hub [label: "FD-991", rating: "3P+N"]
f1l1ld = load [label: "PNL-1496", rating: "DC FAST CHARGER BANK / 176 kW"]
f1l2ld = load [label: "PNL-1424", rating: "FORECOURT LIGHTING / 19 kW"]
f2cb = breaker [label: "CB-364", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-753", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1462", rating: "CANOPY AUXILIARIES / 24 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
