sld "GEN-1412 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-427", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
mcbA1 = breaker [label: "CB-351", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-771", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
f1cb = breaker [label: "CB-310", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-729", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1091", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-377", rating: "MCCB / 100 A / 3P"]
f1l1drv = vfd [label: "DRV-876", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1143", rating: "48 kW / PROC"]
f2cb = breaker [label: "CB-383", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-784", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-367", rating: "MCCB / 80 A / 3P"]
f2l1m = motor [label: "MTR-1165", rating: "39 kW / COMP"]

srcA1 -> mcbA1
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
f2l1cb -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
