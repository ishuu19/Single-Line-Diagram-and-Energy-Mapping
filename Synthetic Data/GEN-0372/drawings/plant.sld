sld "GEN-0372 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-473", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1642", rating: "690 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-387", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-759", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1031", rating: "kW / kWh"]
f1cb = breaker [label: "CB-331", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-730", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1062", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1414", rating: "SHOP LIGHTING / 11 kW"]
f2cb = breaker [label: "CB-376", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-729", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1077", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1478", rating: "SHOP LIGHTING / 25 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
