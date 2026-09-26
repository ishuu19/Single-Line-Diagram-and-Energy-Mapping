sld "GEN-0463 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-458", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1660", rating: "690 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-389", rating: "MCCB / 1000 A / 3P"]
mctA1 = ct [label: "TA-798", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
f1cb = breaker [label: "CB-331", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-743", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-365", rating: "MCCB / 100 A / 3P"]
f1l1drv = vfd [label: "DRV-881", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1194", rating: "49 kW / COMP"]
f2cb = breaker [label: "CB-304", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-763", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-388", rating: "MCCB / 16 A / 3P"]
f2l1m = motor [label: "MTR-1161", rating: "7 kW / EF"]
f3cb = breaker [label: "CB-398", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-717", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1029", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-375", rating: "MCCB / 25 A / 3P"]
f3l1m = motor [label: "MTR-1152", rating: "10 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
