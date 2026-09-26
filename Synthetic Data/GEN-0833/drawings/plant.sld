sld "GEN-0833 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-476", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
mcbA1 = breaker [label: "CB-335", rating: "MCCB / 630 A / 3P"]
mctA1 = ct [label: "TA-723", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1016", rating: "kW / kWh"]
srcA2 = utility [label: "11kV STANDBY", voltage: "11kV"]
txA2 = transformer_dy [label: "TX-1614", rating: "440 kVA", voltage: "11kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-320", rating: "ACB / 630 A / 3P"]
mctA2 = ct [label: "TA-761", rating: "3 CTs / 630/5 A"]
mpmA2 = watthour_meter [label: "PM-1029", rating: "kW / kWh"]
f1cb = breaker [label: "CB-356", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-787", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1443", rating: "SHOP LIGHTING / 24 kW"]
f2cb = breaker [label: "CB-367", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-768", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-330", rating: "MCCB / 125 A / 3P"]
f2l1drv = vfd [label: "DRV-837", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1143", rating: "50 kW / PROC"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
