sld "GEN-0836 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-490", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1676", rating: "170 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-393", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-753", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1096", rating: "kW / kWh"]
f1cb = breaker [label: "CB-316", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-778", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-327", rating: "MCCB / 63 A / 3P"]
f1l1drv = vfd [label: "DRV-852", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1122", rating: "26 kW / PROC"]
f2cb = breaker [label: "CB-338", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-716", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1050", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-315", rating: "MCCB / 50 A / 3P"]
f2l1drv = vfd [label: "DRV-869", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1189", rating: "23 kW / PROC"]
f3cb = breaker [label: "CB-366", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-764", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1029", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1400", rating: "PRESS FLOOR PANEL / 26 kW"]

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
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
