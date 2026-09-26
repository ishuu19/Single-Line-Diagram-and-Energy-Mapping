sld "GEN-0676 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-446", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1696", rating: "90 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-379", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-781", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
busB = bus [label: "BUS-400", voltage: "208Y/120V"]
srcB1 = utility [label: "12.47kV SUPPLY B", voltage: "12.47kV"]
txB1 = transformer_dy [label: "TX-1656", rating: "140 kVA", voltage: "12.47kV / 208Y/120V"]
mcbB1 = breaker [label: "CB-380", rating: "ACB / 400 A / 3P"]
mctB1 = ct [label: "TA-719", rating: "3 CTs / 400/5 A"]
mpmB1 = watthour_meter [label: "PM-1031", rating: "kW / kWh"]
tie = bus_tie [label: "CB-368", rating: "2000 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-322", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-748", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1048", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1438", rating: "RISER PANEL / 92 kW"]
f2cb = breaker [label: "CB-366", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-703", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1058", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1471", rating: "AUXILIARY PANEL / 29 kW"]
f3cb = breaker [label: "CB-358", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-721", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1409", rating: "AUXILIARY PANEL / 25 kW"]

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
busB -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
