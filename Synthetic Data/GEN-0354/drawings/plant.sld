sld "GEN-0354 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-459", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1694", rating: "550 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-323", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-721", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1026", rating: "kW / kWh"]
srcA2 = utility [label: "20kV STANDBY", voltage: "20kV"]
txA2 = transformer_yd [label: "TX-1641", rating: "690 kVA", voltage: "20kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-335", rating: "ACB / 1000 A / 3P"]
mctA2 = ct [label: "TA-785", rating: "3 CTs / 1000/5 A"]
mpmA2 = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
f1cb = breaker [label: "CB-390", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-754", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1045", rating: "kW / kWh"]
f1pnl = hub [label: "FD-910", rating: "3P+N"]
f1l1ld = load [label: "PNL-1499", rating: "AUXILIARY PANEL / 23 kW"]
f1l2cb = breaker [label: "CB-363", rating: "MCCB / 50 A / 3P"]
f1l2drv = vfd [label: "DRV-859", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1191", rating: "23 kW / BLOW"]
f2cb = breaker [label: "CB-324", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-722", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-388", rating: "MCCB / 80 A / 3P"]
f2l1drv = vfd [label: "DRV-845", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1162", rating: "34 kW / BLOW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
