sld "GEN-0015 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-407", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
mcbA1 = breaker [label: "CB-370", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-759", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1062", rating: "kW / kWh"]
f1cb = breaker [label: "CB-384", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-746", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1096", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-309", rating: "MCCB / 400 A / 3P"]
f1l1m = motor [label: "MTR-1188", rating: "160 kW / BLOW"]
f2cb = breaker [label: "CB-313", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-714", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-364", rating: "MCCB / 800 A / 3P"]
f2l1drv = vfd [label: "DRV-841", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1108", rating: "327 kW / MILL"]
f3cb = breaker [label: "CB-325", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-728", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-382", rating: "MCCB / 320 A / 3P"]
f3l1m = motor [label: "MTR-1173", rating: "135 kW / BLOW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
