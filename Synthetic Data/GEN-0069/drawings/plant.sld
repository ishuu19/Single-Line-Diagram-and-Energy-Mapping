sld "GEN-0069 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-469", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1680", rating: "690 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-318", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-719", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
srcA2 = utility [label: "20kV STANDBY", voltage: "20kV"]
txA2 = transformer_dy [label: "TX-1679", rating: "440 kVA", voltage: "20kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-342", rating: "ACB / 630 A / 3P"]
mctA2 = ct [label: "TA-736", rating: "3 CTs / 630/5 A"]
mpmA2 = watthour_meter [label: "PM-1024", rating: "kW / kWh"]
f1cb = breaker [label: "CB-344", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-748", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1097", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-321", rating: "MCCB / 63 A / 3P"]
f1l1drv = vfd [label: "DRV-802", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1164", rating: "29 kW / PROC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
