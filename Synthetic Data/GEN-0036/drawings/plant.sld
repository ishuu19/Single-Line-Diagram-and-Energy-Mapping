sld "GEN-0036 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-438", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1679", rating: "170 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-357", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-773", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1047", rating: "kW / kWh"]
busB = bus [label: "BUS-480", voltage: "400Y/230V"]
srcB1 = utility [label: "33kV SUPPLY B", voltage: "33kV"]
txB1 = transformer_dy [label: "TX-1651", rating: "1110 kVA", voltage: "33kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-398", rating: "ACB / 1600 A / 3P"]
mctB1 = ct [label: "TA-751", rating: "3 CTs / 1600/5 A"]
mpmB1 = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
tie = bus_tie [label: "CB-336", rating: "1000 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-380", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-711", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1004", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1407", rating: "YARD LIGHTING / 19 kW"]
f2cb = breaker [label: "CB-382", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-749", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1000", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1436", rating: "AUXILIARY PANEL / 12 kW"]
f3cb = breaker [label: "CB-317", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-721", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1446", rating: "YARD LIGHTING / 23 kW"]

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
f2ct -> f2l1ld
busB -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
