sld "GEN-1088 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-448", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1626", rating: "690 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-330", rating: "MCCB / 1000 A / 3P"]
mctA1 = ct [label: "TA-725", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
srcA2 = utility [label: "11kV STANDBY", voltage: "11kV"]
txA2 = transformer_yd [label: "TX-1634", rating: "170 kVA", voltage: "11kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-384", rating: "ACB / 250 A / 3P"]
mctA2 = ct [label: "TA-791", rating: "3 CTs / 250/5 A"]
mpmA2 = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
f1cb = breaker [label: "CB-388", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-704", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1077", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1434", rating: "DC FAST CHARGER BANK / 107 kW"]
f2cb = breaker [label: "CB-356", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-739", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
f2pnl = hub [label: "FD-934", rating: "3P+N"]
f2l1ld = load [label: "PNL-1401", rating: "CANOPY AUXILIARIES / 28 kW"]
f2l2ld = load [label: "PNL-1450", rating: "CANOPY AUXILIARIES / 32 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
