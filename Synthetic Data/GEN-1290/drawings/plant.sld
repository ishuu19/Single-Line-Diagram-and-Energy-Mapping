sld "GEN-1290 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-470", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1680", rating: "1390 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-341", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-722", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1032", rating: "kW / kWh"]
f1cb = breaker [label: "CB-335", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-700", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1072", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-366", rating: "MCCB / 400 A / 3P"]
f1l1m = motor [label: "MTR-1146", rating: "174 kW / BLOW"]
f2cb = breaker [label: "CB-392", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-757", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1043", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-305", rating: "MCCB / 1000 A / 3P"]
f2l1drv = vfd [label: "DRV-861", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1161", rating: "560 kW / MILL"]
f2x = capacitor_bank [label: "CAP-611", rating: "50 kVAR"]

srcA1 -> txA1
txA1 -> mcbA1
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
f2ct -> f2x
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
