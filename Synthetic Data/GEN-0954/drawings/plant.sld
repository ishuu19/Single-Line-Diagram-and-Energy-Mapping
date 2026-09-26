sld "GEN-0954 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-424", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1674", rating: "440 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-346", rating: "MCCB / 630 A / 3P"]
mctA1 = ct [label: "TA-767", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1091", rating: "kW / kWh"]
f1cb = breaker [label: "CB-339", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-726", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1044", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1455", rating: "PRESS FLOOR PANEL / 26 kW"]
f2cb = breaker [label: "CB-310", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-718", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1016", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-374", rating: "MCCB / 63 A / 3P"]
f2l1drv = vfd [label: "DRV-835", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1163", rating: "29 kW / PROC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
