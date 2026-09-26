sld "GEN-0438 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-493", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1603", rating: "170 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-323", rating: "MCCB / 250 A / 3P"]
mctA1 = ct [label: "TA-796", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1003", rating: "kW / kWh"]
f1cb = breaker [label: "CB-353", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-752", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1021", rating: "kW / kWh"]
f1pnl = hub [label: "FD-909", rating: "3P+N"]
f1l1ld = load [label: "PNL-1476", rating: "CANOPY AUXILIARIES / 31 kW"]
f1l2ld = load [label: "PNL-1493", rating: "FORECOURT LIGHTING / 12 kW"]
f2cb = breaker [label: "CB-331", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-732", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1057", rating: "kW / kWh"]
f2pnl = hub [label: "FD-923", rating: "3P+N"]
f2l1ld = load [label: "PNL-1471", rating: "DC FAST CHARGER BANK / 128 kW"]
f2l2ld = load [label: "PNL-1467", rating: "DC FAST CHARGER BANK / 110 kW"]
f3cb = breaker [label: "CB-382", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-728", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1089", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1427", rating: "DC FAST CHARGER BANK / 230 kW"]

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
