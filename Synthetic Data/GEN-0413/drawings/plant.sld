sld "GEN-0413 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-499", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1616", rating: "690 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-333", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-712", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1042", rating: "kW / kWh"]
srcA2 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "1250 kW"]
mcbA2 = breaker [label: "CB-368", rating: "ACB / 2000 A / 3P"]
mctA2 = ct [label: "TA-751", rating: "3 CTs / 2000/5 A"]
mpmA2 = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
f1cb = breaker [label: "CB-329", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-738", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1021", rating: "kW / kWh"]
f1pnl = hub [label: "FD-944", rating: "3P+N"]
f1l1cb = breaker [label: "CB-304", rating: "MCCB / 25 A / 3P"]
f1l1m = motor [label: "MTR-1197", rating: "10 kW / EF"]
f1l2cb = breaker [label: "CB-317", rating: "MCCB / 100 A / 3P"]
f1l2drv = vfd [label: "DRV-820", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1132", rating: "49 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
