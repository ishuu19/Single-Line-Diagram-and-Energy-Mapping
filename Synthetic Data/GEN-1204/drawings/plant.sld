sld "GEN-1204 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-422", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
mcbA1 = breaker [label: "CB-357", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-710", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1044", rating: "kW / kWh"]
f1cb = breaker [label: "CB-370", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-732", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1088", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-355", rating: "MCCB / 50 A / 3P"]
f1l1drv = vfd [label: "DRV-851", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1165", rating: "24 kW / CRAC"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
mctA1 -> mpmA1
f1ct -> f1pm
