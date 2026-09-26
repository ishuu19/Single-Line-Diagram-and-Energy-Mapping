sld "GEN-0215 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-499", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1603", rating: "1110 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-353", rating: "MCCB / 1600 A / 3P"]
mctA1 = ct [label: "TA-716", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 358 kW", voltage: "400Y/230V"]
mcbA2 = breaker [label: "CB-372", rating: "MCCB / 400 A / 3P"]
mctA2 = ct [label: "TA-782", rating: "3 CTs / 400/5 A"]
mpmA2 = watthour_meter [label: "PM-1097", rating: "kW / kWh"]
f1cb = breaker [label: "CB-305", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-726", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
f1pnl = hub [label: "FD-912", rating: "3P+N"]
f1l1ld = load [label: "PNL-1466", rating: "RISER PANEL / 96 kW"]
f1l2ld = load [label: "PNL-1470", rating: "RISER PANEL / 42 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
