sld "GEN-1049 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-450", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1609", rating: "690 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-376", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-740", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
busB = bus [label: "BUS-481", voltage: "400Y/230V"]
srcB1 = utility [label: "11kV SUPPLY B", voltage: "11kV"]
txB1 = transformer_yd [label: "TX-1631", rating: "440 kVA", voltage: "11kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-341", rating: "ACB / 630 A / 3P"]
mctB1 = ct [label: "TA-726", rating: "3 CTs / 630/5 A"]
mpmB1 = watthour_meter [label: "PM-1032", rating: "kW / kWh"]
tie = bus_tie [label: "CB-384", rating: "1600 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-336", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-776", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1411", rating: "AUXILIARY PANEL / 19 kW"]
f2cb = breaker [label: "CB-387", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-759", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1013", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1492", rating: "FLOOR LIGHTING / 58 kW"]
f3cb = breaker [label: "CB-300", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-718", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1011", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1460", rating: "AUXILIARY PANEL / 27 kW"]

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
busA -> f2cb [cable: "3#4 AWG"]
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
