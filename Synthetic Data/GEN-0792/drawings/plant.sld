sld "GEN-0792 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-426", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
mcbA1 = breaker [label: "CB-399", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-767", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1004", rating: "kW / kWh"]
f1cb = breaker [label: "CB-395", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-765", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1094", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-362", rating: "MCCB / 25 A / 3P"]
f1l1m = motor [label: "MTR-1155", rating: "11 kW / COND"]
f2cb = breaker [label: "CB-309", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-788", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-319", rating: "MCCB / 63 A / 3P"]
f2l1drv = vfd [label: "DRV-802", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1110", rating: "27 kW / PROC"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
