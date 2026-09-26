sld "GEN-0123 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-408", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1638", rating: "290 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-399", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-755", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1077", rating: "kW / kWh"]
busB = bus [label: "BUS-418", voltage: "208Y/120V"]
srcB1 = utility [label: "12.47kV SUPPLY B", voltage: "12.47kV"]
txB1 = transformer_dy [label: "TX-1615", rating: "720 kVA", voltage: "12.47kV / 208Y/120V"]
mcbB1 = breaker [label: "CB-336", rating: "ACB / 2000 A / 3P"]
mctB1 = ct [label: "TA-776", rating: "3 CTs / 2000/5 A"]
mpmB1 = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
tie = bus_tie [label: "CB-339", rating: "2000 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-313", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-753", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1097", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1456", rating: "FORECOURT LIGHTING / 14 kW"]
f2cb = breaker [label: "CB-388", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-722", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1056", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1424", rating: "DC FAST CHARGER BANK / 156 kW"]
f3cb = breaker [label: "CB-353", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-764", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1044", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1472", rating: "FORECOURT LIGHTING / 22 kW"]

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
busB -> f2cb [cable: "3#4/0 AWG"]
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
