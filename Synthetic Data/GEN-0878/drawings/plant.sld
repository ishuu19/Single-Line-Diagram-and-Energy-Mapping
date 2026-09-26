sld "GEN-0878 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-421", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1613", rating: "1390 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-392", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-755", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1033", rating: "kW / kWh"]
f1cb = breaker [label: "CB-396", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-748", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1466", rating: "PRESS FLOOR PANEL / 37 kW"]
f2cb = breaker [label: "CB-323", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-747", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1407", rating: "PRESS FLOOR PANEL / 18 kW"]
f3cb = breaker [label: "CB-342", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-726", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1029", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1492", rating: "SHOP LIGHTING / 22 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
