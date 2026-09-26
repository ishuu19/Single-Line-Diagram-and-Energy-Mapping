sld "GEN-1512 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-496", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1643", rating: "1730 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-343", rating: "MCCB / 2500 A / 3P"]
mctA1 = ct [label: "TA-739", rating: "3 CTs / 2500/5 A"]
mpmA1 = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
srcA2 = utility [label: "11kV STANDBY", voltage: "11kV"]
txA2 = transformer_yd [label: "TX-1687", rating: "2080 kVA", voltage: "11kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-321", rating: "ACB / 3000 A / 3P"]
mctA2 = ct [label: "TA-786", rating: "3 CTs / 3000/5 A"]
mpmA2 = watthour_meter [label: "PM-1018", rating: "kW / kWh"]
f1cb = breaker [label: "CB-322", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-708", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1043", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-362", rating: "MCCB / 1000 A / 3P"]
f1l1drv = vfd [label: "DRV-854", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1131", rating: "418 kW / MILL"]

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
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
