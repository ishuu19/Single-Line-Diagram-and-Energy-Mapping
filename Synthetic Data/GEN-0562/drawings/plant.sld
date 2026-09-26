sld "GEN-0562 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-477", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1638", rating: "140 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-371", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-749", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
busB = bus [label: "BUS-473", voltage: "208Y/120V"]
srcB1 = utility [label: "12.47kV SUPPLY B", voltage: "12.47kV"]
txB1 = transformer_yd [label: "TX-1648", rating: "290 kVA", voltage: "12.47kV / 208Y/120V"]
mcbB1 = breaker [label: "CB-386", rating: "MCCB / 800 A / 3P"]
mctB1 = ct [label: "TA-728", rating: "3 CTs / 800/5 A"]
mpmB1 = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
tie = bus_tie [label: "CB-304", rating: "1000 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-374", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-778", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1087", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1480", rating: "REEFER RACK PANEL / 111 kW"]
f2cb = breaker [label: "CB-345", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-711", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1054", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1455", rating: "YARD LIGHTING / 15 kW"]
f3cb = breaker [label: "CB-370", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-746", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1032", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1414", rating: "YARD LIGHTING / 20 kW"]

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
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
