sld "GEN-0538 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-459", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1658", rating: "280 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-353", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-727", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
busB = bus [label: "BUS-477", voltage: "400Y/230V"]
srcB1 = utility [label: "20kV SUPPLY B", voltage: "20kV"]
txB1 = transformer_yd [label: "TX-1619", rating: "440 kVA", voltage: "20kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-310", rating: "MCCB / 630 A / 3P"]
mctB1 = ct [label: "TA-785", rating: "3 CTs / 630/5 A"]
mpmB1 = watthour_meter [label: "PM-1060", rating: "kW / kWh"]
tie = bus_tie [label: "CB-384", rating: "800 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-372", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-745", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1073", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1463", rating: "AUXILIARY PANEL / 25 kW"]
f2cb = breaker [label: "CB-391", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-767", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1089", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1490", rating: "CELLAR PANEL / 23 kW"]
f3cb = breaker [label: "CB-304", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-796", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1483", rating: "AUXILIARY PANEL / 29 kW"]

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
busB -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
