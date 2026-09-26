sld "GEN-0923 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-458", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1622", rating: "170 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-389", rating: "MCCB / 250 A / 3P"]
mctA1 = ct [label: "TA-752", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1043", rating: "kW / kWh"]
busB = bus [label: "BUS-432", voltage: "400Y/230V"]
srcB1 = utility [label: "22kV SUPPLY B", voltage: "22kV"]
txB1 = transformer_yd [label: "TX-1640", rating: "170 kVA", voltage: "22kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-312", rating: "MCCB / 250 A / 3P"]
mctB1 = ct [label: "TA-719", rating: "3 CTs / 250/5 A"]
mpmB1 = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
tie = bus_tie [label: "CB-330", rating: "800 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-363", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-795", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1033", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1494", rating: "CANOPY AUXILIARIES / 23 kW"]
f2cb = breaker [label: "CB-350", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-727", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1066", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1452", rating: "CANOPY AUXILIARIES / 18 kW"]
f3cb = breaker [label: "CB-373", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-710", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1047", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1468", rating: "FORECOURT LIGHTING / 19 kW"]

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
