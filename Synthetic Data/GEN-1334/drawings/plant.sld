sld "GEN-1334 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-493", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1672", rating: "1110 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-345", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-797", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1044", rating: "kW / kWh"]
f1cb = breaker [label: "CB-399", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-763", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1472", rating: "FORECOURT LIGHTING / 16 kW"]
f2cb = breaker [label: "CB-375", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-730", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
f2pnl = hub [label: "FD-919", rating: "3P+N"]
f2l1ld = load [label: "PNL-1475", rating: "DC FAST CHARGER BANK / 203 kW"]
f2l2ld = load [label: "PNL-1407", rating: "DC FAST CHARGER BANK / 190 kW"]
f3cb = breaker [label: "CB-368", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-734", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
f3pnl = hub [label: "FD-955", rating: "3P+N"]
f3l1ld = load [label: "PNL-1462", rating: "DC FAST CHARGER BANK / 89 kW"]
f3l2ld = load [label: "PNL-1419", rating: "CANOPY AUXILIARIES / 31 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
