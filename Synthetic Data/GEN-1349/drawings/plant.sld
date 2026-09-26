sld "GEN-1349 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-484", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1616", rating: "170 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-360", rating: "MCCB / 250 A / 3P"]
mctA1 = ct [label: "TA-764", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1094", rating: "kW / kWh"]
srcA2 = utility [label: "22kV STANDBY", voltage: "22kV"]
txA2 = transformer_yd [label: "TX-1617", rating: "690 kVA", voltage: "22kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-335", rating: "ACB / 1000 A / 3P"]
mctA2 = ct [label: "TA-775", rating: "3 CTs / 1000/5 A"]
mpmA2 = watthour_meter [label: "PM-1038", rating: "kW / kWh"]
f1cb = breaker [label: "CB-328", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-708", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1096", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1435", rating: "COMMON AREA LIGHTING / 40 kW"]
f2cb = breaker [label: "CB-338", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-770", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1438", rating: "RISER PANEL / 56 kW"]
f3cb = breaker [label: "CB-342", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-756", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1033", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1488", rating: "COMMON AREA LIGHTING / 24 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
