sld "GEN-1087 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-446", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
mcbA1 = breaker [label: "CB-352", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-734", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
f1cb = breaker [label: "CB-319", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-781", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1047", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-394", rating: "MCCB / 50 A / 3P"]
f1l1drv = vfd [label: "DRV-805", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1140", rating: "24 kW / PROC"]

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
