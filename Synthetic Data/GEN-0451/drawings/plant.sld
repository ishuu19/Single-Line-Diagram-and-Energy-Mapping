sld "GEN-0451 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-454", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1640", rating: "280 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-399", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-753", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1033", rating: "kW / kWh"]
f1cb = breaker [label: "CB-353", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-725", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-331", rating: "MCCB / 100 A / 3P"]
f1l1drv = vfd [label: "DRV-827", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1149", rating: "42 kW / PROC"]
f2cb = breaker [label: "CB-393", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-722", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1040", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-344", rating: "MCCB / 80 A / 3P"]
f2l1m = motor [label: "MTR-1130", rating: "34 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
