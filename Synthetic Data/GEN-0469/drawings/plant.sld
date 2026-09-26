sld "GEN-0469 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-420", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1692", rating: "550 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-358", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-771", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1054", rating: "kW / kWh"]
srcA2 = utility [label: "20kV STANDBY", voltage: "20kV"]
txA2 = transformer_yd [label: "TX-1620", rating: "440 kVA", voltage: "20kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-395", rating: "ACB / 630 A / 3P"]
mctA2 = ct [label: "TA-787", rating: "3 CTs / 630/5 A"]
mpmA2 = watthour_meter [label: "PM-1060", rating: "kW / kWh"]
f1cb = breaker [label: "CB-304", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-741", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1090", rating: "kW / kWh"]
f1pnl = hub [label: "FD-920", rating: "3P+N"]
f1l1ld = load [label: "PNL-1496", rating: "SHOP LIGHTING / 24 kW"]
f1l2ld = load [label: "PNL-1411", rating: "PRESS FLOOR PANEL / 39 kW"]

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
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
