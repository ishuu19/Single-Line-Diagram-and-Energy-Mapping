sld "GEN-1531 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-489", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1623", rating: "1390 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-324", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-725", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
f1cb = breaker [label: "CB-378", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-735", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-358", rating: "MCCB / 40 A / 3P"]
f1l1drv = vfd [label: "DRV-804", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1184", rating: "17 kW / PROC"]
f2cb = breaker [label: "CB-354", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-766", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1087", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1465", rating: "SHOP LIGHTING / 11 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
