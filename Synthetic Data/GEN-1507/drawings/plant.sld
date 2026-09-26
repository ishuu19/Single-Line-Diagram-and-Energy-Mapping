sld "GEN-1507 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-498", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1655", rating: "440 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-352", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-752", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1030", rating: "kW / kWh"]
busB = bus [label: "BUS-446", voltage: "400Y/230V"]
srcB1 = utility [label: "20kV SUPPLY B", voltage: "20kV"]
txB1 = transformer_yd [label: "TX-1666", rating: "1390 kVA", voltage: "20kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-379", rating: "ACB / 2000 A / 3P"]
mctB1 = ct [label: "TA-749", rating: "3 CTs / 2000/5 A"]
mpmB1 = watthour_meter [label: "PM-1011", rating: "kW / kWh"]
tie = bus_tie [label: "CB-329", rating: "400 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-323", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-721", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-313", rating: "MCCB / 63 A / 3P"]
f1l1drv = vfd [label: "DRV-880", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1134", rating: "28 kW / AHU"]
f2cb = breaker [label: "CB-315", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-778", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1056", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1439", rating: "SITE LIGHTING / 26 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> txB1
txB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busB -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
