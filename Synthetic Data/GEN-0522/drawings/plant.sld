sld "GEN-0522 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-471", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1645", rating: "1390 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-374", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-763", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
f1cb = breaker [label: "CB-356", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-758", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-371", rating: "MCCB / 80 A / 3P"]
f1l1drv = vfd [label: "DRV-801", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1150", rating: "33 kW / PROC"]
f2cb = breaker [label: "CB-379", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-708", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1047", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1485", rating: "PRESS FLOOR PANEL / 38 kW"]

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
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
