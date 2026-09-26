sld "GEN-0156 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-428", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1625", rating: "170 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-314", rating: "MCCB / 250 A / 3P"]
mctA1 = ct [label: "TA-744", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1013", rating: "kW / kWh"]
f1cb = breaker [label: "CB-335", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-738", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1056", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-343", rating: "MCCB / 80 A / 3P"]
f1l1drv = vfd [label: "DRV-894", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1135", rating: "35 kW / PROC"]

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
