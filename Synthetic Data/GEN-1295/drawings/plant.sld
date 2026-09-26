sld "GEN-1295 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-486", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1602", rating: "1390 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-314", rating: "MCCB / 2000 A / 3P"]
mctA1 = ct [label: "TA-710", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1098", rating: "kW / kWh"]
f1cb = breaker [label: "CB-312", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-799", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1076", rating: "kW / kWh"]
f1pnl = hub [label: "FD-980", rating: "3P+N"]
f1l1cb = breaker [label: "CB-360", rating: "MCCB / 80 A / 3P"]
f1l1drv = vfd [label: "DRV-857", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1193", rating: "33 kW / RWP"]
f1l2ld = load [label: "PNL-1469", rating: "DOSING PANEL / 22 kW"]
f2cb = breaker [label: "CB-358", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-719", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1037", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-329", rating: "MCCB / 160 A / 3P"]
f2l1drv = vfd [label: "DRV-800", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1144", rating: "70 kW / RWP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
