sld "GEN-0224 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-497", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1688", rating: "440 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-359", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-760", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
busB = bus [label: "BUS-481", voltage: "400Y/230V"]
srcB1 = utility [label: "11kV SUPPLY B", voltage: "11kV"]
txB1 = transformer_dy [label: "TX-1698", rating: "280 kVA", voltage: "11kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-363", rating: "ACB / 400 A / 3P"]
mctB1 = ct [label: "TA-797", rating: "3 CTs / 400/5 A"]
mpmB1 = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
tie = bus_tie [label: "CB-306", rating: "1600 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-328", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-747", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1058", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1467", rating: "AUXILIARY PANEL / 7 kW"]
f2cb = breaker [label: "CB-390", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-736", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1030", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1416", rating: "REEFER RACK PANEL / 93 kW"]
f3cb = breaker [label: "CB-367", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-708", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1426", rating: "AUXILIARY PANEL / 14 kW"]

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
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
