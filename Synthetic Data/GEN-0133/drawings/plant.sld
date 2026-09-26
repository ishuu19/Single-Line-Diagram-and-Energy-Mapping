sld "GEN-0133 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-456", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1660", rating: "440 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-324", rating: "MCCB / 630 A / 3P"]
mctA1 = ct [label: "TA-709", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1089", rating: "kW / kWh"]
busB = bus [label: "BUS-400", voltage: "400Y/230V"]
srcB1 = utility [label: "33kV SUPPLY B", voltage: "33kV"]
txB1 = transformer_yd [label: "TX-1681", rating: "690 kVA", voltage: "33kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-382", rating: "ACB / 1000 A / 3P"]
mctB1 = ct [label: "TA-700", rating: "3 CTs / 1000/5 A"]
mpmB1 = watthour_meter [label: "PM-1079", rating: "kW / kWh"]
tie = bus_tie [label: "CB-368", rating: "2000 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-381", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-746", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-330", rating: "MCCB / 125 A / 3P"]
f1l1drv = vfd [label: "DRV-812", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1191", rating: "55 kW / PROC"]
f2cb = breaker [label: "CB-377", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-796", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1011", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-320", rating: "MCCB / 63 A / 3P"]
f2l1m = motor [label: "MTR-1162", rating: "29 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> txB1
txB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busB -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
