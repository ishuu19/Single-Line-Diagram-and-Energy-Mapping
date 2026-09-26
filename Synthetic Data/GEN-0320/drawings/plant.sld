sld "GEN-0320 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-466", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1652", rating: "690 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-328", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-783", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1013", rating: "kW / kWh"]
busB = bus [label: "BUS-482", voltage: "400Y/230V"]
srcB1 = utility [label: "20kV SUPPLY B", voltage: "20kV"]
txB1 = transformer_dy [label: "TX-1615", rating: "1110 kVA", voltage: "20kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-309", rating: "MCCB / 1600 A / 3P"]
mctB1 = ct [label: "TA-706", rating: "3 CTs / 1600/5 A"]
mpmB1 = watthour_meter [label: "PM-1043", rating: "kW / kWh"]
tie = bus_tie [label: "CB-305", rating: "630 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-325", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-756", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1000", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1445", rating: "SHOP LIGHTING / 22 kW"]
f2cb = breaker [label: "CB-389", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-785", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1490", rating: "AUXILIARY PANEL / 25 kW"]
f3cb = breaker [label: "CB-386", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-787", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1087", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1409", rating: "SHOP LIGHTING / 21 kW"]

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
busB -> f2cb [cable: "3#2/0 AWG"]
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
