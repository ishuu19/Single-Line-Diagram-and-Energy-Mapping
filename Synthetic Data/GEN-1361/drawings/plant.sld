sld "GEN-1361 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-410", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1672", rating: "440 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-314", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-719", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
f1cb = breaker [label: "CB-315", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-774", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1020", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-305", rating: "MCCB / 50 A / 3P"]
f1l1drv = vfd [label: "DRV-826", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1172", rating: "22 kW / PROC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
mctA1 -> mpmA1
f1ct -> f1pm
