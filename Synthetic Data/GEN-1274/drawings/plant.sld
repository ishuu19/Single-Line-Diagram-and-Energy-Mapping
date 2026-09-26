sld "GEN-1274 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-459", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1621", rating: "690 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-309", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-727", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1004", rating: "kW / kWh"]
f1cb = breaker [label: "CB-389", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-770", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-353", rating: "MCCB / 100 A / 3P"]
f1l1drv = vfd [label: "DRV-893", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1169", rating: "43 kW / BLOW"]
f2cb = breaker [label: "CB-326", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-754", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1079", rating: "kW / kWh"]
f2pnl = hub [label: "FD-969", rating: "3P+N"]
f2l1cb = breaker [label: "CB-331", rating: "MCCB / 50 A / 3P"]
f2l1drv = vfd [label: "DRV-898", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1185", rating: "23 kW / BLOW"]
f2l2cb = breaker [label: "CB-300", rating: "MCCB / 160 A / 3P"]
f2l2drv = vfd [label: "DRV-817", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1154", rating: "65 kW / RWP"]

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
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
f2pnl -> f2l2cb
f2l2cb -> f2l2drv
f2l2drv -> f2l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
