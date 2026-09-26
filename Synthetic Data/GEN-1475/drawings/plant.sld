sld "GEN-1475 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-428", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1606", rating: "1390 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-355", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-729", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1029", rating: "kW / kWh"]
srcA2 = utility [label: "20kV STANDBY", voltage: "20kV"]
txA2 = transformer_dy [label: "TX-1682", rating: "1110 kVA", voltage: "20kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-312", rating: "ACB / 1600 A / 3P"]
mctA2 = ct [label: "TA-733", rating: "3 CTs / 1600/5 A"]
mpmA2 = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
f1cb = breaker [label: "CB-308", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-735", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1017", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1467", rating: "AUXILIARY PANEL / 55 kW"]
f2cb = breaker [label: "CB-305", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-726", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1056", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1489", rating: "AUXILIARY PANEL / 26 kW"]
f3cb = breaker [label: "CB-306", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-762", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1077", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-374", rating: "MCCB / 63 A / 3P"]
f3l1drv = vfd [label: "DRV-826", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1134", rating: "27 kW / BLOW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
