sld "GEN-0595 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-424", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1654", rating: "1110 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-303", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-744", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1069", rating: "kW / kWh"]
f1cb = breaker [label: "CB-389", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-730", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1025", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-348", rating: "MCCB / 63 A / 3P"]
f1l1drv = vfd [label: "DRV-894", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1157", rating: "28 kW / AHU"]
f2cb = breaker [label: "CB-342", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-720", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1019", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-315", rating: "MCCB / 63 A / 3P"]
f2l1drv = vfd [label: "DRV-886", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1153", rating: "26 kW / AHU"]
f3cb = breaker [label: "CB-345", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-784", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1034", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1496", rating: "LIFE SAFETY BRANCH / 48 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
