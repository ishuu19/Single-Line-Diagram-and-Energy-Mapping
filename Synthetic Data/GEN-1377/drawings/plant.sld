sld "GEN-1377 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-424", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1633", rating: "550 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-385", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-748", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1018", rating: "kW / kWh"]
srcA2 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "1250 kW"]
mcbA2 = breaker [label: "CB-388", rating: "ACB / 2000 A / 3P"]
mctA2 = ct [label: "TA-756", rating: "3 CTs / 2000/5 A"]
mpmA2 = watthour_meter [label: "PM-1068", rating: "kW / kWh"]
f1cb = breaker [label: "CB-387", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-766", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1087", rating: "kW / kWh"]
f1pnl = hub [label: "FD-923", rating: "3P+N"]
f1l1cb = breaker [label: "CB-331", rating: "MCCB / 80 A / 3P"]
f1l1drv = vfd [label: "DRV-833", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1171", rating: "33 kW / CRAC"]
f1l2cb = breaker [label: "CB-380", rating: "MCCB / 25 A / 3P"]
f1l2m = motor [label: "MTR-1121", rating: "10 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
