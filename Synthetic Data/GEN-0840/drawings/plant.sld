sld "GEN-0840 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-482", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1654", rating: "1110 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-347", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-780", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1041", rating: "kW / kWh"]
f1cb = breaker [label: "CB-350", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-786", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1069", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-355", rating: "MCCB / 80 A / 3P"]
f1l1drv = vfd [label: "DRV-816", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1199", rating: "38 kW / CRAC"]
f2cb = breaker [label: "CB-383", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-753", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1447", rating: "FLOOR LIGHTING / 60 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
