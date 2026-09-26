sld "GEN-0726 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-427", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
mcbA1 = breaker [label: "CB-336", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-715", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
srcA2 = utility [label: "22kV STANDBY", voltage: "22kV"]
txA2 = transformer_dy [label: "TX-1674", rating: "440 kVA", voltage: "22kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-313", rating: "MCCB / 630 A / 3P"]
mctA2 = ct [label: "TA-770", rating: "3 CTs / 630/5 A"]
mpmA2 = watthour_meter [label: "PM-1039", rating: "kW / kWh"]
f1cb = breaker [label: "CB-303", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-738", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1017", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-373", rating: "MCCB / 50 A / 3P"]
f1l1drv = vfd [label: "DRV-858", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1168", rating: "21 kW / PROC"]
f2cb = breaker [label: "CB-327", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-741", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1492", rating: "PRESS FLOOR PANEL / 21 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
