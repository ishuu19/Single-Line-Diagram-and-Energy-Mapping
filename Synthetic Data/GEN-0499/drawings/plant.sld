sld "GEN-0499 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-402", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
mcbA1 = breaker [label: "CB-355", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-771", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1077", rating: "kW / kWh"]
f1cb = breaker [label: "CB-394", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-724", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1053", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-322", rating: "MCCB / 63 A / 3P"]
f1l1drv = vfd [label: "DRV-822", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1125", rating: "16 kW / PROC"]
f2cb = breaker [label: "CB-344", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-776", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1030", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-349", rating: "MCCB / 160 A / 3P"]
f2l1drv = vfd [label: "DRV-869", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1132", rating: "40 kW / PROC"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
