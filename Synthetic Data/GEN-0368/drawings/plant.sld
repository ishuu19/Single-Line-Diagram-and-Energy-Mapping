sld "GEN-0368 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-447", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1622", rating: "440 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-320", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-760", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1066", rating: "kW / kWh"]
f1cb = breaker [label: "CB-393", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-786", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-382", rating: "MCCB / 80 A / 3P"]
f1l1drv = vfd [label: "DRV-837", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1104", rating: "36 kW / PROC"]
f2cb = breaker [label: "CB-319", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-790", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1411", rating: "SHOP LIGHTING / 17 kW"]
f3cb = breaker [label: "CB-396", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-756", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1077", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-328", rating: "MCCB / 50 A / 3P"]
f3l1drv = vfd [label: "DRV-872", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1150", rating: "23 kW / PROC"]

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
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
