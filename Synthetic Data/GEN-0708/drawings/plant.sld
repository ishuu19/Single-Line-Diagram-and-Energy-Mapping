sld "GEN-0708 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-402", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1629", rating: "1110 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-353", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-706", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f1cb = breaker [label: "CB-357", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-766", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1067", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-387", rating: "MCCB / 80 A / 3P"]
f1l1drv = vfd [label: "DRV-806", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1116", rating: "34 kW / AHU"]
f2cb = breaker [label: "CB-384", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-724", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1041", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-319", rating: "MCCB / 63 A / 3P"]
f2l1drv = vfd [label: "DRV-809", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1174", rating: "28 kW / AHU"]
f3cb = breaker [label: "CB-334", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-765", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1492", rating: "CLASSROOM LIGHTING / 39 kW"]

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
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
