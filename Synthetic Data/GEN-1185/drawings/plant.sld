sld "GEN-1185 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-402", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1600", rating: "170 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-372", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-733", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1095", rating: "kW / kWh"]
busB = bus [label: "BUS-439", voltage: "400Y/230V"]
srcB1 = utility [label: "22kV SUPPLY B", voltage: "22kV"]
txB1 = transformer_dy [label: "TX-1636", rating: "440 kVA", voltage: "22kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-324", rating: "ACB / 630 A / 3P"]
mctB1 = ct [label: "TA-737", rating: "3 CTs / 630/5 A"]
mpmB1 = watthour_meter [label: "PM-1060", rating: "kW / kWh"]
tie = bus_tie [label: "CB-310", rating: "1000 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-347", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-796", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1455", rating: "CLASSROOM LIGHTING / 31 kW"]
f2cb = breaker [label: "CB-352", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-782", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1038", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-339", rating: "MCCB / 50 A / 3P"]
f2l1drv = vfd [label: "DRV-860", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1144", rating: "23 kW / AHU"]

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
f1ct -> f1l1ld
busB -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
