sld "GEN-0299 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-481", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1663", rating: "1390 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-397", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-748", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1037", rating: "kW / kWh"]
f1cb = breaker [label: "CB-364", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-711", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1062", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-327", rating: "MCCB / 800 A / 3P"]
f1l1drv = vfd [label: "DRV-811", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1113", rating: "359 kW / MILL"]

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
