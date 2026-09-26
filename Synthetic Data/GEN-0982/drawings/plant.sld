sld "GEN-0982 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-463", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1628", rating: "550 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-384", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-713", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
busB = bus [label: "BUS-484", voltage: "400Y/230V"]
srcB1 = utility [label: "11kV SUPPLY B", voltage: "11kV"]
txB1 = transformer_yd [label: "TX-1683", rating: "550 kVA", voltage: "11kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-322", rating: "ACB / 800 A / 3P"]
mctB1 = ct [label: "TA-799", rating: "3 CTs / 800/5 A"]
mpmB1 = watthour_meter [label: "PM-1047", rating: "kW / kWh"]
tie = bus_tie [label: "CB-324", rating: "800 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-329", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-783", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-323", rating: "MCCB / 40 A / 3P"]
f1l1drv = vfd [label: "DRV-881", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1151", rating: "19 kW / BLOW"]
f2cb = breaker [label: "CB-378", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-714", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1089", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-360", rating: "MCCB / 100 A / 3P"]
f2l1drv = vfd [label: "DRV-869", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1186", rating: "41 kW / BLOW"]

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
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busB -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
