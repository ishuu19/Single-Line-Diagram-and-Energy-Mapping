sld "GEN-1390 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-481", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1664", rating: "1110 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-300", rating: "MCCB / 1600 A / 3P"]
mctA1 = ct [label: "TA-747", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1060", rating: "kW / kWh"]
busB = bus [label: "BUS-483", voltage: "400Y/230V"]
srcB1 = utility [label: "6.6kV SUPPLY B", voltage: "6.6kV"]
txB1 = transformer_yd [label: "TX-1658", rating: "170 kVA", voltage: "6.6kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-303", rating: "ACB / 250 A / 3P"]
mctB1 = ct [label: "TA-799", rating: "3 CTs / 250/5 A"]
mpmB1 = watthour_meter [label: "PM-1004", rating: "kW / kWh"]
tie = bus_tie [label: "CB-359", rating: "800 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-311", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-798", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1081", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1486", rating: "AUXILIARY PANEL / 38 kW"]
f2cb = breaker [label: "CB-353", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-794", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1468", rating: "DOCK PANEL / 31 kW"]
f3cb = breaker [label: "CB-322", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-783", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1451", rating: "DOCK PANEL / 26 kW"]

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
busA -> f2cb [cable: "3#1/0 AWG"]
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
