sld "GEN-0870 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-478", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1632", rating: "1110 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-308", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-729", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1031", rating: "kW / kWh"]
busB = bus [label: "BUS-445", voltage: "400Y/230V"]
srcB1 = utility [label: "33kV SUPPLY B", voltage: "33kV"]
txB1 = transformer_dy [label: "TX-1649", rating: "690 kVA", voltage: "33kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-322", rating: "ACB / 1000 A / 3P"]
mctB1 = ct [label: "TA-701", rating: "3 CTs / 1000/5 A"]
mpmB1 = watthour_meter [label: "PM-1044", rating: "kW / kWh"]
tie = bus_tie [label: "CB-367", rating: "2000 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-375", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-777", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1037", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1481", rating: "CONTROL PANEL / 13 kW"]
f2cb = breaker [label: "CB-335", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-733", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1043", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1494", rating: "AUXILIARY PANEL / 13 kW"]
f3cb = breaker [label: "CB-385", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-789", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1048", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1409", rating: "GROW LIGHTING / 79 kW"]

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
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
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
