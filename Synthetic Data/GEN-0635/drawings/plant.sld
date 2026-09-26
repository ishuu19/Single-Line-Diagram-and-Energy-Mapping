sld "GEN-0635 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-443", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1685", rating: "1390 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-398", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-773", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1018", rating: "kW / kWh"]
f1cb = breaker [label: "CB-389", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-717", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1053", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-371", rating: "MCCB / 25 A / 3P"]
f1l1m = motor [label: "MTR-1193", rating: "11 kW / EF"]
f2cb = breaker [label: "CB-306", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-735", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1032", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-360", rating: "MCCB / 16 A / 3P"]
f2l1m = motor [label: "MTR-1128", rating: "6 kW / EF"]
f3cb = breaker [label: "CB-303", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-789", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-324", rating: "MCCB / 40 A / 3P"]
f3l1drv = vfd [label: "DRV-801", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1178", rating: "16 kW / CRAC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
