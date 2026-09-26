sld "GEN-1194 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-466", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
mcbA1 = breaker [label: "CB-332", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-710", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1020", rating: "kW / kWh"]
f1cb = breaker [label: "CB-339", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-776", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-313", rating: "MCCB / 125 A / 3P"]
f1l1drv = vfd [label: "DRV-832", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1152", rating: "62 kW / PROC"]

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
