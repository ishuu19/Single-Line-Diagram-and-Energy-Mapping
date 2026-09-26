sld "GEN-1330 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-439", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1655", rating: "170 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-338", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-771", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1025", rating: "kW / kWh"]
f1cb = breaker [label: "CB-344", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-742", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-353", rating: "MCCB / 63 A / 3P"]
f1l1drv = vfd [label: "DRV-823", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1145", rating: "26 kW / PROC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
mctA1 -> mpmA1
f1ct -> f1pm
