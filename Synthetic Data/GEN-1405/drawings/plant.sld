sld "GEN-1405 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-434", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1632", rating: "280 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-331", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-708", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1088", rating: "kW / kWh"]
srcA2 = utility [label: "20kV STANDBY", voltage: "20kV"]
txA2 = transformer_dy [label: "TX-1667", rating: "1110 kVA", voltage: "20kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-362", rating: "ACB / 1600 A / 3P"]
mctA2 = ct [label: "TA-748", rating: "3 CTs / 1600/5 A"]
mpmA2 = watthour_meter [label: "PM-1063", rating: "kW / kWh"]
f1cb = breaker [label: "CB-395", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-794", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-308", rating: "MCCB / 40 A / 3P"]
f1l1drv = vfd [label: "DRV-888", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1166", rating: "16 kW / CRAC"]
f2cb = breaker [label: "CB-375", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-729", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1090", rating: "kW / kWh"]
f2pnl = hub [label: "FD-951", rating: "3P+N"]
f2l1ld = load [label: "PNL-1467", rating: "COMMON AREA LIGHTING / 25 kW"]
f2l2cb = breaker [label: "CB-379", rating: "MCCB / 16 A / 3P"]
f2l2m = motor [label: "MTR-1124", rating: "7 kW / EF"]

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
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2cb
f2l2cb -> f2l2m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
