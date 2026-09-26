sld "GEN-0282 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-472", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1621", rating: "690 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-335", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-798", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1066", rating: "kW / kWh"]
f1cb = breaker [label: "CB-381", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-735", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1094", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-303", rating: "MCCB / 160 A / 3P"]
f1l1drv = vfd [label: "DRV-819", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1169", rating: "64 kW / PROC"]
f2cb = breaker [label: "CB-340", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-773", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-316", rating: "MCCB / 100 A / 3P"]
f2l1m = motor [label: "MTR-1105", rating: "43 kW / COMP"]
f3cb = breaker [label: "CB-398", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-775", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1090", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1458", rating: "SHOP LIGHTING / 29 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
