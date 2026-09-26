sld "GEN-0900 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-438", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1673", rating: "690 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-356", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-715", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1030", rating: "kW / kWh"]
f1cb = breaker [label: "CB-331", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-789", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-350", rating: "MCCB / 125 A / 3P"]
f1l1drv = vfd [label: "DRV-813", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1193", rating: "58 kW / PROC"]
f2cb = breaker [label: "CB-312", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-793", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1032", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-363", rating: "MCCB / 80 A / 3P"]
f2l1m = motor [label: "MTR-1169", rating: "34 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
