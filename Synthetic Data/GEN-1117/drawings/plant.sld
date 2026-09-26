sld "GEN-1117 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-435", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1654", rating: "170 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-389", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-768", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1013", rating: "kW / kWh"]
srcA2 = utility [label: "20kV STANDBY", voltage: "20kV"]
mcbA2 = breaker [label: "CB-319", rating: "MCCB / 1600 A / 3P"]
mctA2 = ct [label: "TA-741", rating: "3 CTs / 1600/5 A"]
mpmA2 = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
f1cb = breaker [label: "CB-302", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-749", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1096", rating: "kW / kWh"]
f1pnl = hub [label: "FD-947", rating: "3P+N"]
f1l1ld = load [label: "PNL-1459", rating: "PRESS FLOOR PANEL / 22 kW"]
f1l2cb = breaker [label: "CB-332", rating: "MCCB / 40 A / 3P"]
f1l2drv = vfd [label: "DRV-896", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1139", rating: "16 kW / PROC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
