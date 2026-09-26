sld "GEN-0092 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-461", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1664", rating: "690 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-312", rating: "MCCB / 1000 A / 3P"]
mctA1 = ct [label: "TA-728", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
f1cb = breaker [label: "CB-359", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-751", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1050", rating: "kW / kWh"]
f1pnl = hub [label: "FD-967", rating: "3P+N"]
f1l1ld = load [label: "PNL-1412", rating: "DC FAST CHARGER BANK / 228 kW"]
f1l2ld = load [label: "PNL-1462", rating: "CANOPY AUXILIARIES / 34 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
mctA1 -> mpmA1
f1ct -> f1pm
