sld "GEN-1322 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-449", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1630", rating: "1110 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-371", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-790", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1051", rating: "kW / kWh"]
busB = bus [label: "BUS-497", voltage: "400Y/230V"]
srcB1 = utility [label: "6.6kV SUPPLY B", voltage: "6.6kV"]
txB1 = transformer_dy [label: "TX-1641", rating: "170 kVA", voltage: "6.6kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-354", rating: "ACB / 250 A / 3P"]
mctB1 = ct [label: "TA-723", rating: "3 CTs / 250/5 A"]
mpmB1 = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
tie = bus_tie [label: "CB-333", rating: "1000 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-314", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-741", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1403", rating: "AUXILIARY PANEL / 12 kW"]
f2cb = breaker [label: "CB-331", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-785", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1054", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1466", rating: "AUXILIARY PANEL / 10 kW"]
f3cb = breaker [label: "CB-361", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-700", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1018", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1446", rating: "REEFER RACK PANEL / 109 kW"]

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
busA -> f2cb [cable: "3#4 AWG"]
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
