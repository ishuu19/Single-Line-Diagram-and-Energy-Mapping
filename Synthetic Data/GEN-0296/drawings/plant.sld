sld "GEN-0296 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-419", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1626", rating: "230 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-381", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-755", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1077", rating: "kW / kWh"]
busB = bus [label: "BUS-417", voltage: "208Y/120V"]
srcB1 = utility [label: "12.47kV SUPPLY B", voltage: "12.47kV"]
txB1 = transformer_yd [label: "TX-1616", rating: "140 kVA", voltage: "12.47kV / 208Y/120V"]
mcbB1 = breaker [label: "CB-363", rating: "ACB / 400 A / 3P"]
mctB1 = ct [label: "TA-700", rating: "3 CTs / 400/5 A"]
mpmB1 = watthour_meter [label: "PM-1036", rating: "kW / kWh"]
tie = bus_tie [label: "CB-372", rating: "400 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-301", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-709", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1490", rating: "FORECOURT LIGHTING / 25 kW"]
f2cb = breaker [label: "CB-396", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-754", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1031", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1442", rating: "FORECOURT LIGHTING / 15 kW"]
f3cb = breaker [label: "CB-314", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-726", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1007", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1487", rating: "CANOPY AUXILIARIES / 25 kW"]

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
busB -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
