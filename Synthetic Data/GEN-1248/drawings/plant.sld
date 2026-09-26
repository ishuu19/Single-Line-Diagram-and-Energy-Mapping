sld "GEN-1248 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-436", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1607", rating: "1110 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-302", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-789", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f1cb = breaker [label: "CB-364", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-758", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1090", rating: "kW / kWh"]
f1pnl = hub [label: "FD-937", rating: "3P+N"]
f1l1ld = load [label: "PNL-1460", rating: "RISER PANEL / 61 kW"]
f1l2ld = load [label: "PNL-1449", rating: "COMMON AREA LIGHTING / 20 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
mctA1 -> mpmA1
f1ct -> f1pm
