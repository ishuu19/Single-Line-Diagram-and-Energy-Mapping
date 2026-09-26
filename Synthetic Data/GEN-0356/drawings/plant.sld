sld "GEN-0356 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-454", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1688", rating: "1110 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-336", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-792", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1011", rating: "kW / kWh"]
srcA2 = utility [label: "33kV STANDBY", voltage: "33kV"]
txA2 = transformer_yd [label: "TX-1630", rating: "1390 kVA", voltage: "33kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-388", rating: "ACB / 2000 A / 3P"]
mctA2 = ct [label: "TA-770", rating: "3 CTs / 2000/5 A"]
mpmA2 = watthour_meter [label: "PM-1050", rating: "kW / kWh"]
f1cb = breaker [label: "CB-300", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-703", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
f1pnl = hub [label: "FD-913", rating: "3P+N"]
f1l1ld = load [label: "PNL-1425", rating: "PRESS FLOOR PANEL / 39 kW"]
f1l2ld = load [label: "PNL-1416", rating: "SHOP LIGHTING / 24 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
