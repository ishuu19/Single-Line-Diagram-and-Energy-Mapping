sld "GEN-0204 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-498", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1600", rating: "170 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-317", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-768", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1096", rating: "kW / kWh"]
busB = bus [label: "BUS-438", voltage: "400Y/230V"]
srcB1 = utility [label: "33kV SUPPLY B", voltage: "33kV"]
txB1 = transformer_yd [label: "TX-1637", rating: "1110 kVA", voltage: "33kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-373", rating: "ACB / 1600 A / 3P"]
mctB1 = ct [label: "TA-725", rating: "3 CTs / 1600/5 A"]
mpmB1 = watthour_meter [label: "PM-1047", rating: "kW / kWh"]
tie = bus_tie [label: "CB-339", rating: "1600 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-391", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-791", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1045", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1435", rating: "CANOPY AUXILIARIES / 23 kW"]
f2cb = breaker [label: "CB-305", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-784", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1051", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1451", rating: "CANOPY AUXILIARIES / 16 kW"]
f3cb = breaker [label: "CB-364", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-765", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1419", rating: "CANOPY AUXILIARIES / 17 kW"]

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
busB -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
