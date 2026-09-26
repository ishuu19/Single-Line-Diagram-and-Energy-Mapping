sld "GEN-0408 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-436", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1656", rating: "170 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-358", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-701", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
srcA2 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "1250 kW"]
mcbA2 = breaker [label: "CB-366", rating: "MCCB / 2000 A / 3P"]
mctA2 = ct [label: "TA-721", rating: "3 CTs / 2000/5 A"]
mpmA2 = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
srcA3 = solar [label: "PV ARRAY 493 kW", voltage: "400Y/230V"]
mcbA3 = breaker [label: "CB-359", rating: "MCCB / 400 A / 3P"]
mctA3 = ct [label: "TA-784", rating: "3 CTs / 400/5 A"]
mpmA3 = watthour_meter [label: "PM-1007", rating: "kW / kWh"]
f1cb = breaker [label: "CB-373", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-757", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1095", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-302", rating: "MCCB / 63 A / 3P"]
f1l1drv = vfd [label: "DRV-895", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1181", rating: "30 kW / CRAC"]
f2cb = breaker [label: "CB-338", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-760", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1476", rating: "COMMON AREA LIGHTING / 28 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
srcA3 -> mcbA3
mcbA3 -> mctA3
mctA3 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
mctA3 -> mpmA3
f1ct -> f1pm
f2ct -> f2pm
