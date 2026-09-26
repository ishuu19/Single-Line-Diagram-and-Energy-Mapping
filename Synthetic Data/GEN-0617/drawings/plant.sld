sld "GEN-0617 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-456", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
mcbA1 = breaker [label: "CB-304", rating: "MCCB / 1600 A / 3P"]
mctA1 = ct [label: "TA-752", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1034", rating: "kW / kWh"]
f1cb = breaker [label: "CB-340", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-724", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1013", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-391", rating: "MCCB / 50 A / 3P"]
f1l1drv = vfd [label: "DRV-833", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1119", rating: "21 kW / CRAC"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
mctA1 -> mpmA1
f1ct -> f1pm
