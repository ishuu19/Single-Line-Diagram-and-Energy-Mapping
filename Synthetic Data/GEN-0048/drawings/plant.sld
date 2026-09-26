sld "GEN-0048 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-482", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1635", rating: "290 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-328", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-713", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1058", rating: "kW / kWh"]
f1cb = breaker [label: "CB-313", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-705", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-332", rating: "MCCB / 160 A / 3P"]
f1l1drv = vfd [label: "DRV-898", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1146", rating: "41 kW / PROC"]
f2cb = breaker [label: "CB-323", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-759", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1033", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-321", rating: "MCCB / 320 A / 3P"]
f2l1drv = vfd [label: "DRV-800", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1162", rating: "75 kW / PROC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
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
