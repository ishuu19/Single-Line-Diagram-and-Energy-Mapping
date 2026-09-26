sld "GEN-1304 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-408", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1602", rating: "690 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-377", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-785", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1018", rating: "kW / kWh"]
f1cb = breaker [label: "CB-316", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-758", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1069", rating: "kW / kWh"]
f1pnl = hub [label: "FD-967", rating: "3P+N"]
f1l1ld = load [label: "PNL-1464", rating: "FORECOURT LIGHTING / 17 kW"]
f1l2ld = load [label: "PNL-1446", rating: "DC FAST CHARGER BANK / 239 kW"]
f2cb = breaker [label: "CB-310", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-775", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1438", rating: "DC FAST CHARGER BANK / 183 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
